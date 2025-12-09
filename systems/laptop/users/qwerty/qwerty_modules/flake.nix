#qwerty_modules.nix
{
  description = "qwerty modules flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    dev_module.url = "path:./dev_module";
    system_module.url = "path:./system_module";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.dev_module.nixosModules.default
        self.inputs.system_module.nixosModules.default
      ];
    };
    nixosModules.celeste = { config, pkgs, ... }: {
      imports = [
        self.inputs.dev_module.nixosModules.default
        self.inputs.system_module.nixosModules.default
      ];

      fonts.packages = with pkgs; [
        monocraft
      ];
    };  
  };
}
