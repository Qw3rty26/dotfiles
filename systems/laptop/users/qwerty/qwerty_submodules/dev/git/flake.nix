#git.nix
{
  description = "git home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        git
      ];
      programs.git = {
        enable = true;
        userName = "Qw3rty26";
        userEmail = "asarovalerio26@gmail.com";
      };
    };
  };
}
