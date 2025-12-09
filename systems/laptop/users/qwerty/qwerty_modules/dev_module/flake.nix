#dev_modules.nix
{
  description = "dev modules flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    
    cifs_module.url = "path:./cifs_module";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.cifs_module.nixosModules.default
      ];
    };
  };
}
