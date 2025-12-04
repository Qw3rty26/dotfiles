#qwerty.nix
{
  description = "qwerty flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    #configuration.url = "path:./"
    home-manager.url = "github:nix-community/home-manager/release-24.11";
   # MainModules.url = "path:./qwerty_modules";
    SubModules.url = "path:./qwerty_submodules";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosModules.default = { config, pkgs, ...}:
    let
      # SET HOME-MANAGER USERNAME
      username = "qwerty";
    in
    {
      imports = [
        ./configuration.nix
        ./graphical-environment.nix
    #    self.inputs.MainModules.nixosModules.default
        home-manager.nixosModules.home-manager
      ];
      
        home-manager.users.${username} = nixpkgs.lib.mkForce (self.inputs.SubModules.homeManagerModule.default {
        config = config;
        pkgs = pkgs;
        username = username;
      }); # IMPORTS HOME-MANAGER SUB MODULES
    };
  };
}
