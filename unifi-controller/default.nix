{ pkgs ? import ./pkgs.nix }:

let
  inherit (pkgs) callPackage jdk8;
  imagePrefix = "zaninime";
  jre = (jdk8.override { headless = true; }).jre;
in rec {
  unifi-5_11_50 = callPackage ./docker.nix {
    inherit imagePrefix jre;
    version = "5.11.50";
    sha256 = "0f36q02d22hlssavszl99xjykz3j0f2ki68rj14v3wl8j3rkfc03";
  };

  unifi-5_11_x = unifi-5_11_50.override { imageTag = "5.11"; };

  # ---

  unifi-5_6_42 = callPackage ./docker.nix {
    inherit imagePrefix jre;
    version = "5.6.42";
    sha256 = "1yqih58h9p9mp8qg53193l2gph99vdrpm89swwinsklcn7dwmik6";
  };

  unifi-5_6_x = unifi-5_6_42.override { imageTag = "5.6"; };
}
