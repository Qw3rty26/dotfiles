#ssh_module.nix
{
  description = "ssh-agent module flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { pkgs, ... }: {
      #services.ssh-agent.enable = true;
    };
  };
}
