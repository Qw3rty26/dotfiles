#misc.nix
{
  description = "misc home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    #neofetch.url = "path:./neofetch"; << EXAMPLE
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.neofetch = { pkgs, ... }: {
      imports = [
        #self.inputs.neofetch.homeManagerModule.default << EXAMPLE
      ];
    };
  };
}
