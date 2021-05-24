{ pkgs ? import ./nix/pkgs.nix }:

let
  inherit (pkgs) callPackage;
  imagePrefix = "zaninime";
in rec {
  unifi-6_2_x = callPackage ./docker.nix {
    inherit imagePrefix;
    src = pkgs.unifi-6_2_x;
  };

  unifi-6_2 = unifi-6_2_x.override { imageTag = "6.2"; };
}
