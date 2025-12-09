#picom.nix
{
  description = "picom home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        picom
      ];

      home.file.".config/picom/picom.conf" = {
        source = ./picom_default.conf;
      };
    };
    homeManagerModule.celeste = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        picom
      ];

      home.file.".config/picom/picom.conf" = {
        source = ./picom_celeste.conf;
      };
    };
  };
}
