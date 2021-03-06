{ lib, stdenv, writers, dockerTools, busybox, su-exec, callPackage, skopeo
, mkShell, src, imagePrefix ? null, imageTag ? null, registryHost ? "docker.io",
}:

with lib;

let
  inherit (src) version;
  makePorts = proto: ports:
    listToAttrs
    (map (port: nameValuePair "${toString port}/${proto}" { }) ports);

  # https://help.ubnt.com/hc/en-us/articles/218506997-UniFi-Ports-Used
  tcpPorts = makePorts "tcp" [ 8080 8443 8880 8843 6789 27117 ];
  udpPorts = makePorts "udp" [ 1900 3478 5656 5657 5658 5659 10001 ];

  app = callPackage ./unifi.nix { inherit src; };
  baseName = app.pname;

  entrypointScript = writers.writeBash "${baseName}-entrypoint" ''
    set -euo pipefail

    if [ "$1" = 'unifi' ]; then
      chown unifi:unifi /dev/stdout /unifi/*
      exec ${su-exec}/bin/su-exec unifi:unifi /unifi/bin/${baseName} start
    else
      exec "$@"
    fi
  '';

  containerImage = dockerTools.buildImage {
    name =
      if imagePrefix != null then "${imagePrefix}/${baseName}" else baseName;
    tag = if imageTag != null then imageTag else version;

    contents = [ busybox ];

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

    runAsRoot = ''
      #!${stdenv.shell}
      set -euo pipefail
      ${dockerTools.shadowSetup}
      set -x

      groupadd -g 999 unifi
      useradd -d /unifi -g unifi -M -u 999 unifi

      mkdir /tmp
      chmod 0777 /tmp

      cp -r ${app}/. /unifi
      mkdir /unifi/logs
      ln -sf /dev/stdout /unifi/logs/server.log

      chmod +w unifi
    '';
  };

  pushScript =
    writers.writeBash "${baseName}-push-container-image-${version}" ''
      set -euo pipefail

      readonly imageUri="${registryHost}/${containerImage.imageName}:${containerImage.imageTag}"

      echo "Pushing $imageUri"
      exec "${skopeo}/bin/skopeo" copy "docker-archive:${containerImage}" "docker://$imageUri" "$@"
    '';
in { inherit containerImage pushScript app; }
