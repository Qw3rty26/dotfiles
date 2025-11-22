#example neofetch.nix
{
  description = "example of a neofetch home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { pkgs, ... }: {
        home.packages = with pkgs; [
          neofetch
        ];
    };
  };
}
