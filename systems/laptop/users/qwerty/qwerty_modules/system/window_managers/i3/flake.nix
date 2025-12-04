#i3_module.nix
{
  description = "i3 module flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { pkgs, ... }: {
      services.xserver.windowManager.i3.enable = true;
    };
  };
}
