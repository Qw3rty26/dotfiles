#users.nix
{
  description = "users flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    guest.url = "path:./guest";
    qwerty.url = "path:./qwerty";            
  };

  outputs = { self, nixpkgs,  ... }: {
    nixosModules.guest = { config, pkgs, ... }:
    {
      imports = [
        self.inputs.guest.nixosModules.default      
      ];
    };

    nixosModules.qwerty = { config, pkgs, ... }:
    {
      imports = [
        self.inputs.qwerty.nixosModules.default      
      ];
    };
  };
}
