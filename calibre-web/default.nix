{ pkgs ? import ./pkgs.nix }: rec {
  full = pkgs.callPackage ./docker.nix { };
  slim = full.override { slimVariant = true; };
}
