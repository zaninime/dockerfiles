let
  rev = "cc6cf0a96a627e678ffc996a8f9d1416200d6c81";
  repo = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/${rev}.tar.gz";
    sha256 = "1srjikizp8ip4h42x7kr4qf00lxcp1l8zp6h0r1ddfdyw8gv9001";
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
