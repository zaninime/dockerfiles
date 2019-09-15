{ pkgs ? import <nixpkgs> { } }:
let
  inherit (builtins) substring;
  inherit (pkgs) stdenv makeWrapper ruby bundlerEnv fetchFromGitHub mkShell;

  baseName = "standardfile-server";
  rev = "20d74bf5fe22ca18737b00354d23ba06e6136bfe";
  version = substring 0 8 rev;

  src = fetchFromGitHub {
    inherit rev;
    owner = "standardfile";
    repo = "ruby-server";
    sha256 = "1nnaam7ba16wbi3246ipijmbxri0x953yqr6h92ijbd9zwlay4bv";
  };

  runBundix = mkShell {
    buildInputs = with pkgs; [
      bundix
      bundler
      # libiconv
      libxml2
      # libxslt
      mysql57
      openssl
      pkgconfig
      ruby
    ];

    shellHook = ''
      echo bundle install --path ./vendor
      echo bundix
    '';
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

in stdenv.mkDerivation {
  name = "${baseName}-${version}";
  inherit version src;

  passthru = { inherit src runBundix; };

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
