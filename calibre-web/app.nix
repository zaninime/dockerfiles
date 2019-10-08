{ pkgs ? import ./pkgs.nix }:

with pkgs.lib;

let
  inherit (pkgs) stdenv fetchFromGitHub mkShell python37 python37Packages;
  pname = "calibre-web";
  version = "0.6.5b0";

  src = fetchFromGitHub {
    owner = "janeczku";
    repo = pname;
    rev = "0c40e40dc3e416e9f04280eccb7c9d5dd0c216a7";
    sha256 = "092j37q2bjrha5qfi4dwna3isg25akhcs6xfpyqs4k5g117gm9d8";
  };

  pip2nix = (import ((fetchFromGitHub {
    owner = "nix-community";
    repo = "pip2nix";
    rev = "ed6905c746f578120537fe0466415672c58703f5";
    sha256 = "0nzcwy7vzmz876v4x5dyhd965ncw00m36bsnx15vbdfl4jpaq90f";
  }) + "/release.nix") { }).pip2nix.python37;

  deps2nix = mkShell {
    nativeBuildInputs = [ pip2nix ];
    shellHook = ''
      set -euo pipefail
      exec pip2nix generate -r ${src}/requirements.txt
    '';
  };

  pinnedPythonPackages = import ./python-packages.nix {
    inherit pkgs;
    inherit (pkgs) fetchurl fetchgit fetchhg;
  };

  pythonPackages =
    (fix (extends pinnedPythonPackages python37Packages.__unfix__));

  deps = let names = builtins.attrNames (pinnedPythonPackages { } { });
  in attrValues (getAttrs names pythonPackages);

in pythonPackages.buildPythonApplication rec {
  inherit pname version src;
  patches = [
    ./patches/0001-overhaul-setup.patch
    ./patches/0002-stop-server.patch
    ./patches/0003-log-stderr.patch
  ];
  passthru = { inherit deps2nix; };
  propagatedBuildInputs = deps;
  doCheck = false;

  postInstall = ''
    mkdir -p $out/bin
    cp cps.py $out/bin/cps
  '';
}
