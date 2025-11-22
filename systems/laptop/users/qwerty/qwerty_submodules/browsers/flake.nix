#browsers.nix
{
  description = "browsers home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    homeManager.url = "github:nix-community/home-manager/release-24.11";
    firefox.url = "path:./firefox";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.firefox.homeManagerModule.default
      ];
    };
  };
}
