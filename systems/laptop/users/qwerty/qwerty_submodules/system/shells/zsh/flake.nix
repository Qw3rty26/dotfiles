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
      };

      home.sessionVariables = { # set zsh dotfiles path to /.config/zsh
        ZDOTDIR = "${config.home.homeDirectory}/.config/zsh";
      };

      home.file.".config/zsh/.zshrc" = {
        source = ./.zshrc;
      };

      home.file.".config/zsh/oh-my-zsh" = {
        source = ./oh-my-zsh;
        recursive = true;
      };
      
      home.file.".config/zsh/syntax-highlighting" = {
        source = ./syntax-highlighting;
        recursive = true;
      };

      home.file.".config/zsh/zsh-autosuggestions" = {
        source = ./zsh-autosuggestions;
        recursive = true;
      };
    };
  };
}
