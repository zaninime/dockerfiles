{ pkgs ? import ./nix/pkgs.nix }:

let
  inherit (pkgs) callPackage;
  imagePrefix = "zaninime";
in rec {
  unifi-5_12_x = callPackage ./docker.nix {
    inherit imagePrefix;
    src = pkgs.unifi-5_12_x;
  };

  unifi-5_12 = unifi-5_12_x.override { imageTag = "5.12"; };
}
