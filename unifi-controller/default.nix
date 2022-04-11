let
  sources = import ./nix/sources.nix;

  localPkgs = self: super: {
    unifi = self.callPackage ./pkgs/unifi.nix { };
    unifi-docker = self.callPackage ./pkgs/docker.nix { };
  };

in import sources.nixpkgs { overlays = [ localPkgs ]; }
