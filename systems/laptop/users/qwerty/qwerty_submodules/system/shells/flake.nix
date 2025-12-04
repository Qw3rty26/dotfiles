#shells.nix
{
  description = "shells home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    zsh.url = "path:./zsh";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.zsh.homeManagerModule.default
      ];
    };
  };
}
