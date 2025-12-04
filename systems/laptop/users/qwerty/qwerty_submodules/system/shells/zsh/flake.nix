#zsh.nix
{
  description = "zsh home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        zsh
      ];

      home.sessionVariables = { # set zsh config path to /.config/zsh
        ZDOTDIR = "${config.home.homeDirectory}/.config/zsh";
      };

      home.file.".config/zsh/.zshrc" = {
        source = ./.zshrc;
      };
    };
  };
}
