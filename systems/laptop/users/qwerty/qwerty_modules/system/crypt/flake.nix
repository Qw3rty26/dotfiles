#crypt_modules.nix
{
  description = "crypt modules flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    ssh.url = "path:./ssh";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { pkgs, ... }: {
      imports = [
        self.inputs.ssh.nixosModules.default
      ];
    };
  };
}
