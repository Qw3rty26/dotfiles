#systems.nix
{
  description = "systems flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    laptop.url = "path:./laptop";
    #server.url = "path:./server";
  };

  outputs = { self, nixpkgs,  ... }: {
    nixosModules."guest@laptop" = { config, pkgs, ... }: {
      imports = [
        self.inputs.laptop.nixosModules.guest
      ];
    };
    nixosModules."qwerty@laptop" = { config, pkgs, ... }: {
      imports = [
        self.inputs.laptop.nixosModules.qwerty
      ];
    };
  };
}
