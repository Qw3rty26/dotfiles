#starship.nix
{
  description = "starship home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        starship
      ];
      home.sessionVariables = { # set zsh dotfiles path to /.config/starship
        STARSHIP_CONFIG = "${config.home.homeDirectory}/.config/starship/starship.toml";
      };
      home.file.".config/starship/starship.toml" = {
        source = ./starship_default;
      };
    };

    homeManagerModule.celeste = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        starship
      ];
      home.sessionVariables = { # set zsh dotfiles path to /.config/starship
        STARSHIP_CONFIG = "${config.home.homeDirectory}/.config/starship/starship.toml";
      };
      home.file.".config/starship/starship.toml" = {
        source = ./starship_celeste;
      };
    };
  };
}
