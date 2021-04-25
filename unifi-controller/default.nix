{ pkgs ? import ./nix/pkgs.nix }:

let
  inherit (pkgs) callPackage;
  imagePrefix = "zaninime";
in rec {
  unifi-6_1_x = callPackage ./docker.nix {
    inherit imagePrefix;
    src = pkgs.unifi-6_1_x;
  };

  unifi-6_1 = unifi-6_1_x.override { imageTag = "6.1"; };
}
