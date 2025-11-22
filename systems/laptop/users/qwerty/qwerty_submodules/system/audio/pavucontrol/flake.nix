#pavucontrol.nix
{
  description = "pavucontrol home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
        home.packages = with pkgs; [
          pavucontrol
        ];
    };
  };
}
