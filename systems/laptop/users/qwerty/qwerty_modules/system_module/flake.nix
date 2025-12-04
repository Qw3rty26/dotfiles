#system_modules.nix
{
  description = "system modules flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    
    crypt_module.url = "path:./crypt_module";
    window_managers_module.url = "path:./window_managers_module";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.crypt_module.nixosModules.default
        self.inputs.window_managers_module.nixosModules.default
      ];
    };
  };
}
