let
  rev = "bef773ed53f3d535792d7d7ff3ea50a3deeb1cdd";
  repo = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/${rev}.tar.gz";
    sha256 = "0jhkh6gjdfwk398lkmzb16dgg6h6xyq5l7bh3sa3iw46byfk5i16";
  };
in import repo { }
