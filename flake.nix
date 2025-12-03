#vyrtue.nix
{
  description = "vyrtueOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    systems.url = "path:./systems";
  };

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations."guest@laptop" = nixpkgs.lib.nixosSystem {
      #LAPTOP CONFIG
      inherit system;

      modules = [
        self.inputs.systems.nixosModules."guest@laptop"
      ];
    };
    nixosConfigurations."qwerty@laptop" = nixpkgs.lib.nixosSystem {
      #LAPTOP CONFIG
      inherit system;

      modules = [
        self.inputs.systems.nixosModules."qwerty@laptop"
      ];
    };
  };
}
