#window_managers.nix
{
  description = "window managers home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    feh.url = "path:./feh";
    i3.url = "path:./i3";
    picom.url = "path:./picom"; 
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.feh.homeManagerModule.default
        self.inputs.i3.homeManagerModule.default
        self.inputs.picom.homeManagerModule.default
      ];
    };
  };
}
