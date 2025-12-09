#pcmanfm.nix
{
  description = "pcmanfm home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        pcmanfm
      ];
    };
    homeManagerModule.celeste = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        pcmanfm
      ];
    };
  };
}
