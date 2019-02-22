{ pkgs ? import <nixpkgs> {} }:
let
  inherit (builtins) substring;
  inherit (pkgs) stdenv makeWrapper ruby bundlerEnv fetchFromGitHub;

  baseName = "standardfile-server";
  rev = "0e5e0e1d4c7014a3bfc23fba3a74152f6e804885";
  version = substring 0 8 rev;

  src = fetchFromGitHub {
    inherit rev;
    owner = "standardfile";
    repo = "ruby-server";
    sha256 = "19ahvzm33dpqv8zxy018wk260cxglznxjja9z4lchq2d4fv6ylii";
  };

  rubyEnv = bundlerEnv {
    name = "${baseName}-deps-${version}";
    inherit ruby;

    # Updated with:
    # nix-shell -p bundix -p bundler -p libiconv -p libxml2 -p pkgconfig -p libxslt -p mysql57 -p openssl
    # bundle install --path ./vendor
    # bundix
    gemfile = "${src}/Gemfile";
    lockfile = "${src}/Gemfile.lock";
    gemset = ./gemset.nix;
  };

in

stdenv.mkDerivation {
  name = "${baseName}-${version}";
  inherit version src;

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ rubyEnv rubyEnv.wrappedRuby rubyEnv.bundler ];

  installPhase = ''
    mkdir -p $out/{bin,share}
    cp -r . $out/share/standardfile-server

    for i in files log plugins tmp; do
      rm -rf $out/share/standardfile-server/$i
      ln -fs /run/standardfile-server/$i $out/share/standardfile-server/
    done

    ln -sf $out/share/standardfile-server/bin/rails $out/bin/rails

    makeWrapper $out/bin/rails $out/bin/standardfile-server \
      --add-flags "server"
  '';
}
