#firefox.nix
{
  description = "firefox home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    homeManager.url = "github:nix-community/home-manager/release-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
        home.packages = with pkgs; [
          firefox
        ];
    };
  };
}
