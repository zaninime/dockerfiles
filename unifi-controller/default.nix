{ pkgs ? import ./nix/pkgs.nix }:

let
  inherit (pkgs) callPackage;
  imagePrefix = "zaninime";
in rec {
  unifi-6_0_x = callPackage ./docker.nix {
    inherit imagePrefix;
    src = pkgs.unifi-6_0_x;
  };

  unifi-6_0 = unifi-6_0_x.override { imageTag = "6.0"; };
}
