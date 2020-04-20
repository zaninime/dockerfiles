{ pkgs ? import ./nix/pkgs.nix }:

let
  inherit (pkgs) callPackage;
  imagePrefix = "zaninime";
in rec {
  unifi-5_12_x = callPackage ./docker.nix {
    inherit imagePrefix;
    src = pkgs.unifi-5-12;
  };

  unifi-5_12 = unifi-5_12_x.override { imageTag = "5.12"; };

  # ---

  unifi-5_6_x = callPackage ./docker.nix {
    inherit imagePrefix;
    src = pkgs.unifi-5-6;
  };

  unifi-5_6 = unifi-5_6_x.override { imageTag = "5.6"; };
}
