#cifs.nix
{
  description = "cifs modules flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules.default = { pkgs, ... }: {
      boot.supportedFilesystems = [ "cifs" ];
      environment.systemPackages = with pkgs; [
        cifs-utils
      ];
    };
  };
}
