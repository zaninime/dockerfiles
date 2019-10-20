let
  rev = "1c40ee6fc44f7eb474c69ea070a43247a1a2c83c";
  repo = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/${rev}.tar.gz";
    sha256 = "0xvgx4zsz8jk125xriq7jfp59px8aa0c5idbk25ydh2ly7zmb2df";
  };

  utils = self: super: {
    fetchdeb = { url, sha256 }:
      super.fetchurl {
        inherit url sha256;
        downloadToTemp = true;
        recursiveHash = true;

        postFetch = ''
          ${super.dpkg}/bin/dpkg -x $downloadedFile $out
        '';
      };
  };
in import repo { overlays = [ utils ]; }
