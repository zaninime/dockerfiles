{ pkgs ? import ./pkgs.nix }:

let
  inherit (pkgs) callPackage;
  imagePrefix = "zaninime";
in rec {
  unifi-5_11_47 = callPackage ./docker.nix {
    inherit imagePrefix;
    version = "5.11.47";
    sha256 = "0ri2nr7fgp85rh0w9fjsa05d8zks3qa1n71jps7cmhaa5z6czmbc";
  };

  unifi-5_11_x = unifi-5_11_47.override { imageTag = "5.11"; };
}
