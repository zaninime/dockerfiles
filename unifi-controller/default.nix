{ pkgs ? import ./nix/pkgs.nix }:

let
  inherit (pkgs) callPackage jdk8;
  imagePrefix = "zaninime";
  jre = (jdk8.override { headless = true; }).jre;
in rec {
  unifi-5_12_x = callPackage ./docker.nix {
    inherit imagePrefix jre;
    src = pkgs.unifi-5-12;
  };

  unifi-5_12 = unifi-5_12_x.override { imageTag = "5.12"; };

  # ---

  unifi-5_6_x = callPackage ./docker.nix {
    inherit imagePrefix jre;
    src = pkgs.unifi-5-6;
  };

  unifi-5_6 = unifi-5_6_x.override { imageTag = "5.6"; };
}
