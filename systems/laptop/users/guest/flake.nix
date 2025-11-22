#guest.nix
{
  description = "guest flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    #configuration.url = "path:./"
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    SubModules.url = "path:./guest_submodules";
    # ^^ NAME OF THIS DIRECTORY MUST BE DIFFERENT FROM THE NAME OF THE 
    #SAME DIRECTORY FOR ALL THE OTHER USERS UNDER users/ DIRECTORY!!!
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosModules.default = { config, pkgs, ...}:
    let
      # SET HOME-MANAGER USERNAME
      username = "guest";
    in
    {
      imports = [
        ./configuration.nix
        ./graphical-environment.nix
        home-manager.nixosModules.home-manager
      ];
      
        home-manager.users.${username} = nixpkgs.lib.mkForce (self.inputs.SubModules.homeManagerModule.default {
        pkgs = pkgs;
        username = username;
      }); # IMPORTS HOME-MANAGER SUB MODULES
    };
  };
}
