#system.nix
{
  description = "audio home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    audio.url = "path:./audio";
    consoles.url = "path:./consoles";
    crypt.url = "path:./crypt";
    scripts.url = "path:./scripts";
    shells.url = "path:./shells";
    window_managers.url = "path:./window_managers";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      imports = [
        self.inputs.audio.homeManagerModule.default
        self.inputs.crypt.homeManagerModule.default
        self.inputs.consoles.homeManagerModule.default
        self.inputs.scripts.homeManagerModule.default
        self.inputs.shells.homeManagerModule.default
        self.inputs.window_managers.homeManagerModule.default
      ];
    };
  };
}
