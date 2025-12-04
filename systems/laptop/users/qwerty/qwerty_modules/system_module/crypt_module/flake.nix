#crypt_modules.nix
{
  description = "crypt modules flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    ssh_module.url = "path:./ssh_module";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { pkgs, ... }: {
      imports = [
        self.inputs.ssh_module.nixosModules.default
      ];
    };
  };
}
