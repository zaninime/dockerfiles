{ pkgs ? import ./pkgs.nix }:

let
  inherit (pkgs) callPackage jdk8;
  imagePrefix = "zaninime";
  jre = (jdk8.override { headless = true; }).jre;
in rec {
  unifi-5_11_47 = callPackage ./docker.nix {
    inherit imagePrefix jre;
    version = "5.11.47";
    sha256 = "0ri2nr7fgp85rh0w9fjsa05d8zks3qa1n71jps7cmhaa5z6czmbc";
  };

  unifi-5_11_x = unifi-5_11_47.override { imageTag = "5.11"; };

  # ---

  unifi-5_6_42 = callPackage ./docker.nix {
    inherit imagePrefix jre;
    version = "5.6.42";
    sha256 = "1yqih58h9p9mp8qg53193l2gph99vdrpm89swwinsklcn7dwmik6";
  };

  unifi-5_6_x = unifi-5_6_42.override { imageTag = "5.6"; };
}
