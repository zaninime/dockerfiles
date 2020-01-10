let
  sources = import ./sources.nix;
  customPkgs = _: _: sources;

in import sources.nixpkgs { overlays = [ customPkgs ]; }
