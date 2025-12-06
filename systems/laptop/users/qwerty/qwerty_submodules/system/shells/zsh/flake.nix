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
        ZDOTDIR = "${config.home.homeDirectory}/zsh";
      };

      home.file."${config.xdg.configHome}/zsh/.zshrc" = {
        source = ./.zshrc;
      };

      home.file."${config.xdg.configHome}/zsh/oh-my-zsh" = {
        source = ./oh-my-zsh;
        recursive = true;
      };
      
      home.file."${config.xdg.configHome}/zsh/syntax-highlighting" = {
        source = ./syntax-highlighting;
        recursive = true;
      };

      home.file."${config.xdg.configHome}/zsh/zsh-autosuggestions" = {
        source = ./zsh-autosuggestions;
        recursive = true;
      };
    };
  };
}
