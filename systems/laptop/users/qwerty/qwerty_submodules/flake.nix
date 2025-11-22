#qwerty_home-manager.nix
{
  description = "qwerty home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    browsers.url = "path:./browsers";
    dev.url = "path:./dev";
    editors.url = "path:./editors";
    misc.url = "path:./misc";
    system.url = "path:./system";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, username, ... }: {
      home.username = nixpkgs.lib.mkForce(username);
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.11";
      programs.bash.enable = true;
 
      imports = [
        self.inputs.browsers.homeManagerModule.default
        self.inputs.dev.homeManagerModule.default
        self.inputs.editors.homeManagerModule.default
        self.inputs.misc.homeManagerModule.default
        self.inputs.system.homeManagerModule.default
      ];
    }; 
  };
}
