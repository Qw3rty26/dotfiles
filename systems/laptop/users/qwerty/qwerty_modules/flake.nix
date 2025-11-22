#qwerty_modules.nix
{
  description = "qwerty modules flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    system.url = "path:./system";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.system.nixosModules.default
      ];
    }; 
  };
}
