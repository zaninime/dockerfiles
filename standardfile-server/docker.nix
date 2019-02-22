{ pkgs ? import <nixpkgs> {}, imageName ? "zaninime/standardfile-server" }:
let
  inherit (pkgs) runtimeShell dockerTools mkShell skopeo writeScript busybox;

  pkg = import ./default.nix { inherit pkgs; };

  entrypoint = writeScript "entrypoint.sh" ''
    #!${runtimeShell}
    set -Eeuo pipefail

    if [ "$1" = 'server' ]; then
      exec ${pkg}/bin/standardfile-server -b 0.0.0.0
    fi

    if [ "$1" = 'bootstrap' ]; then
      exec ${pkg}/bin/rails db:create db:migrate
    fi

    if [ "$1" = 'sh' ]; then
      exec ${busybox}/bin/busybox sh
    fi

    exec "$@"
  '';

in rec {
  image = dockerTools.buildLayeredImage {
    name = imageName;
    tag = pkg.version;

    contents = [ busybox ];

    config = {
      Entrypoint = entrypoint;
      Cmd = [ "server" ];
      WorkingDir = "${pkg}/share/standardfile-server";
      Env = [
        "RAILS_ENV=production"
      ];
      ExposedPorts = {
        "3000/tcp" = {};
      };
      Volumes = {
        "/run/standardfile-server/files" = {};
        "/run/standardfile-server/log" = {};
        "/run/standardfile-server/plugins" = {};
        "/run/standardfile-server/tmp" = {};
      };
    };
  };

  push = mkShell {
    shellHook = ''
      ${skopeo}/bin/skopeo copy docker-archive:${image} docker://docker.io/${imageName}:${pkg.version}
      exit 0
    '';
  };
}
