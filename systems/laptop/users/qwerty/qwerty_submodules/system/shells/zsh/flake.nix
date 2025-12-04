#zsh.nix
{
  description = "zsh home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      programs.zsh = {
        enable = true;
        dotDir = "/.config/zsh";

        oh-my-zsh.enable = true;
      };

      home.sessionVariables = { # set zsh config path to /.config/zsh
        ZDOTDIR = "${config.home.homeDirectory}/.config/zsh";
      };

      home.file.".config/zsh/oh-my-zsh" = {
        source = ./oh-my-zsh;
        recursive = true;
      };
    };
  };
}
