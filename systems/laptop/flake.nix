#laptop.nix
{
  description = "laptop flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    users.url = "path:./users";
  };

  outputs = { self, nixpkgs,  ... }: {
    nixosModules.guest = { config, pkgs, ... }: {
      imports = [
        ./hardware-configuration.nix
        self.inputs.users.nixosModules.guest
      ];
    };

    nixosModules.qwerty = { config, pkgs, ... }: {
      imports = [
        ./hardware-configuration.nix
        self.inputs.users.nixosModules.qwerty
      ];
    };
  };
}
