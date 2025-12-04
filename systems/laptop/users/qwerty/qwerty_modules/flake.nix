#qwerty_modules.nix
{
  description = "qwerty modules flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    system_module.url = "path:./system";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.system_module.nixosModules.default
      ];
    }; 
  };
}
