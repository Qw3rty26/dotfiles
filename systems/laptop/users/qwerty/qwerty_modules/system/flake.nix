#system_modules.nix
{
  description = "system modules flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    
    crypt.url = "path:./crypt";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { config, pkgs, ... }: {
      imports = [
        
        self.inputs.crypt.nixosModules.default
      ];
    };
  };
}
