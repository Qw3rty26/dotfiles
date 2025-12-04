#window_managers.nix
{
  description = "window managers home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    i3.url = "path:./i3";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.i3.homeManagerModule.default
      ];
    };
  };
}
