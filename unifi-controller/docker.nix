{ lib, stdenv, writeScript, dockerTools, busybox, su-exec, callPackage, skopeo
, mkShell, jre, version, sha256, imagePrefix ? null, imageTag ? null
, registryHost ? "docker.io", }:

with lib;

let
  makePorts = proto: ports:
    listToAttrs
    (map (port: nameValuePair "${toString port}/${proto}" { }) ports);

  # https://help.ubnt.com/hc/en-us/articles/218506997-UniFi-Ports-Used
  tcpPorts = makePorts "tcp" [ 8080 8443 8880 8843 6789 27117 ];
  udpPorts = makePorts "udp" [ 1900 3478 5656 5657 5658 5659 10001 ];

  app = callPackage ./unifi.nix { inherit jre version sha256; };
  baseName = app.pname;
  imageName =
    if imagePrefix != null then "${imagePrefix}/${baseName}" else baseName;
  tag = if imageTag != null then imageTag else version;
  user = "unifi";
  config = {
    Entrypoint = [ entrypointScript ];
    Cmd = [ "unifi" ];
    ExposedPorts = tcpPorts // udpPorts;
    Volumes = {
      "/unifi/data" = { };
      "/unifi/log" = { };
      "/unifi/run" = { };
    };
  };

  entrypointScript = writeScript "${baseName}-entrypoint" ''
    #!${stdenv.shell}
    set -euo pipefail

    if [ "$1" = 'unifi' ]; then
      chown ${user}:${user} /dev/stdout /unifi/*
      cd /unifi
      exec ${su-exec}/bin/su-exec ${user}:${user} /bin/${baseName} start
    else
      exec "$@"
    fi
  '';

  containerImage = let
    baseImage = dockerTools.buildLayeredImage {
      name = "${imageName}-base";
      inherit tag config;
      maxLayers = 120;
      contents = [ busybox app ];
    };
  in dockerTools.buildImage {
    name = imageName;
    inherit tag config;
    fromImage = baseImage;

    runAsRoot = ''
      #!${stdenv.shell}
      set -euo pipefail
      ${dockerTools.shadowSetup}
      set -x

      groupadd -g 999 ${user}
      useradd -d /unifi -g ${user} -M -u 999 ${user}

      mkdir /tmp
      chmod 0777 /tmp

      mkdir -p /unifi/logs
      chown -R ${user}:${user} /unifi
      ln -sf /dev/stdout /unifi/logs/server.log
    '';
  };

  pushScript = writeScript "${baseName}-push-container-image-${version}" ''
    #!${stdenv.shell}
    set -euo pipefail

    readonly imageUri="${registryHost}/${containerImage.imageName}:${containerImage.imageTag}"

    echo "Pushing $imageUri"
    exec "${skopeo}/bin/skopeo" copy "docker-archive:${containerImage}" "docker://$imageUri" "$@"
  '';

  push = mkShell {
    shellHook = ''
      exec ${pushScript}
    '';
  };
in { inherit containerImage pushScript push app; }
