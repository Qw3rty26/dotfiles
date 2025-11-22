#dev.nix
{
  description = "dev home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    homeManager.url = "github:nix-community/home-manager/release-24.11";
    git.url = "path:./git";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.git.homeManagerModule.default
      ];
    };
  };
}
