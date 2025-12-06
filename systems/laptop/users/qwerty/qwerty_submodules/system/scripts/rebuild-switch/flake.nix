#rebuild-switch.nix
{
  description = "rebuild-switch script home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {

      home.file."${config.xdg.configHome}/scripts/rebuild-switch" = {
        source = ./rebuild-switch;
      };
    };
  };
}
