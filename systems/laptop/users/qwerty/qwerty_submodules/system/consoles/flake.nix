#editors.nix
{
  description = "editors home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    vim.url = "path:./vim";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.vim.homeManagerModule.default
      ];
    };
  };
}
