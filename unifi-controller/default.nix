{ pkgs ? import ./pkgs.nix }:

let
  inherit (pkgs) callPackage jdk8;
  imagePrefix = "zaninime";
  jre = (jdk8.override { headless = true; }).jre;
in rec {
  unifi-5_12_35 = callPackage ./docker.nix {
    inherit imagePrefix jre;
    version = "5.12.35";
    sha256 = "0ml172q4v92mblp90m7w6766hgf8lxaildldrl9fpbk7wisv6kph";
  };

  unifi-5_12_x = unifi-5_12_35.override { imageTag = "5.12"; };

  # ---

  unifi-5_6_42 = callPackage ./docker.nix {
    inherit imagePrefix jre;
    version = "5.6.42";
    sha256 = "1yqih58h9p9mp8qg53193l2gph99vdrpm89swwinsklcn7dwmik6";
  };

  unifi-5_6_x = unifi-5_6_42.override { imageTag = "5.6"; };
}
