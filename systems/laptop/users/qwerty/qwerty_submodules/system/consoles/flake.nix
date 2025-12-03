#consoles.nix
{
  description = "consoles home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    kitty.url = "path:./kitty";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.kitty.homeManagerModule.default
      ];
    };
  };
}
