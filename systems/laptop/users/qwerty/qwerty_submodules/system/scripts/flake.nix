#scripts.nix
{
  description = "scripts home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    check.url = "path:./check";
    rebuild-boot.url = "path:./rebuild-boot";
    rebuild-switch.url = "path:./rebuild-switch";
    update.url = "path:./update";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.check.homeManagerModule.default
        self.inputs.rebuild-boot.homeManagerModule.default
        self.inputs.rebuild-switch.homeManagerModule.default
        self.inputs.update.homeManagerModule.default
      ];
    };
  };
}
