#i3.nix
{
  description = "i3 home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
     /* home.packages = with pkgs; [
        i3
      ];*/
      home.file.".config/i3/config" = {  
        source = ./config.default;
      };
      home.file.".config/i3/wallpapers" = {
        source = ./wallpapers;
        recursive = true;
      };
    };
    homeManagerModule.celeste = { config, pkgs, ... }: {
      home.file.".config/i3/config" = {  
        source = ./config.celeste;
      };
      home.file.".config/i3/wallpapers" = {
        source = ./wallpapers;
        recursive = true;
      };
    };
  };
}
