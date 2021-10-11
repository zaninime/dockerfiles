{ lib, unifi, writers, dockerTools, runtimeShell, busybox, su-exec, skopeo
, writeTextDir, imageName ? "zaninime/unifi-controller"
, registryHost ? "docker.io", user ? "unifi", uid ? 999, gid ? uid }:

with lib;

let
  tag = unifi.version;

  makePorts = proto: ports:
    listToAttrs
    (map (port: nameValuePair "${toString port}/${proto}" { }) ports);

  # https://help.ubnt.com/hc/en-us/articles/218506997-UniFi-Ports-Used
  tcpPorts = makePorts "tcp" [ 8080 8443 8880 8843 6789 27117 ];
  udpPorts = makePorts "udp" [ 1900 3478 5656 5657 5658 5659 10001 ];

  entrypointScript = writers.writeBash "unifi-docker-entrypoint" ''
    set -eu

    if [[ "$1" = 'unifi' ]]; then
      cd /unifi

      echo "Removing old app"
      rm -rf bin dl lib webapps

      echo "Copying app"
      cp -ar ${unifi}/{bin,dl,lib,webapps} .

      echo "Creating the data directory"
      mkdir -p data

      echo "Fixing /tmp dir"
      mkdir -p /tmp
      chmod 0777 /tmp

      echo "Setting up redirect for logs to stdout"
      mkdir -p logs
      ln -sf /dev/stdout logs/server.log

      if [[ ! -f data/system.properties ]]; then
        echo "Creating initial system.properties file"
        echo "$INITIAL_SYSTEM_PROPERTIES" > data/system.properties
      fi

      echo "Fixing permissions"
      chown unifi:unifi /dev/stdout *

      echo "Starting app"
      exec ${su-exec}/bin/su-exec unifi:unifi bin/unifi start
    else
      exec "$@"
    fi
  '';

  nonRootShadowSetup = [
    (writeTextDir "etc/shadow" ''
      root:!x:::::::
      ${user}:!:::::::
    '')
    (writeTextDir "etc/passwd" ''
      root:x:0:0::/root:${runtimeShell}
      ${user}:x:${toString uid}:${toString gid}::/home/${user}:
    '')
    (writeTextDir "etc/group" ''
      root:x:0:
      ${user}:x:${toString gid}:
    '')
    (writeTextDir "etc/gshadow" ''
      root:x::
      ${user}:x::
    '')
  ];

  pushScript = writers.writeBash "unifi-push-container-image-${tag}" ''
    set -euo pipefail

    readonly imageUri="${registryHost}/${imageName}:${tag}"

    echo "Pushing $imageUri"
    exec "${skopeo}/bin/skopeo" copy "docker-archive:${containerImage}" "docker://$imageUri" "$@"
  '';

  containerImage = (dockerTools.buildLayeredImage {
    name = imageName;
    inherit tag;

    contents = [ busybox ] ++ nonRootShadowSetup;

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
  });

in containerImage.overrideAttrs (_: { passthru.pushScript = pushScript; })
