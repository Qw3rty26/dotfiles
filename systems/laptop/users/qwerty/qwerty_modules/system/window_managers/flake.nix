#window_managers.nix
{
  description = "window managers modules flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    i3_module.url = "path:./i3";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { pkgs, ... }: {
      imports = [
        self.inputs.i3_module.nixosModules.default
      ];
    };
  };
}
