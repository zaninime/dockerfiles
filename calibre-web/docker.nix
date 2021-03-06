{ pkgs ? import ./pkgs.nix, slimVariant ? false }:

with pkgs.lib;

let
  inherit (pkgs)
    dockerTools calibre busybox stdenv writeScript su-exec skopeo mkShell;
  app = import ./app.nix { inherit pkgs; };
  inherit (app) pname version;

  user = "calibreweb";

  entrypointScript = writeScript "${pname}-entrypoint-${version}" ''
    #!${stdenv.shell}
    set -euo pipefail

    export CALIBRE_DBPATH=/data/db

    if [ "$1" = 'calibre-web' ]; then
      echo -----------------------------------------------------------
      echo "1. Configure Calibre-Web to read the Calibre DB from /data/calibre"
      echo "2. Make sure owner:group are set to 999:999 on volumes"
        ${
          optionalString (!slimVariant) ''
            echo "3. These binaries are available:"
            echo "  - /bin/ebook-convert"
          ''
        }
      echo -----------------------------------------------------------
      echo
      echo
      exec ${su-exec}/bin/su-exec ${user}:${user} ${app}/bin/cps
    else
      exec "$@"
    fi
  '';

  name = "zaninime/${pname}";
  tag = "${version}${optionalString slimVariant "-slim"}";

  config = {
    Entrypoint = [ entrypointScript ];
    Cmd = [ "calibre-web" ];
    Volumes = {
      "/data/db" = { };
      "/data/calibre" = { };
    };
    ExposedPorts = { "8083/tcp" = { }; };
  };

  containerImage = let
    baseImage = dockerTools.buildLayeredImage {
      name = "${name}-base";
      inherit tag config;
      contents = [ busybox ] ++ optionals (!slimVariant) [ calibre ];
      maxLayers = 120;
    };
  in dockerTools.buildImage {
    inherit name tag config;
    fromImage = baseImage;
    diskSize = 4096;

    runAsRoot = ''
      #!${stdenv.shell}
      set -euo pipefail
      ${dockerTools.shadowSetup}
      set -x

      groupadd -g 999 ${user}
      useradd -d /data -g ${user} -M -u 999 ${user}

      mkdir /tmp
      chmod 0777 /tmp
    '';
  };

  pushScript = writeScript "${pname}-push-container-image-${version}" ''
    #!${stdenv.shell}
    set -euo pipefail

    readonly imageUri="docker.io/${containerImage.imageName}:${containerImage.imageTag}"

    echo "Pushing $imageUri"
    exec "${skopeo}/bin/skopeo" copy "docker-archive:${containerImage}" "docker://$imageUri" "$@"
  '';

  push = mkShell {
    shellHook = ''
      exec ${pushScript}
    '';
  };
in { inherit containerImage pushScript push app; }
