#window_managers.nix
{
  description = "window managers modules flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    i3.url = "path:./i3";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { pkgs, ... }: {
      imports = [
        self.inputs.i3.nixosModules.default
      ];
    };
  };
}
