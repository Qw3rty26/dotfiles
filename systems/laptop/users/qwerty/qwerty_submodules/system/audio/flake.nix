#audio.nix
{
  description = "audio home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    pavucontrol.url = "path:./pavucontrol";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.pavucontrol.homeManagerModule.default
      ];
    };
  };
}
