#crypt.nix
{
  description = "crypt home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    age.url = "path:./age";
    gpg.url = "path:./gpg";  
    sops.url = "path:./sops";
    ssh.url = "path:./ssh";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      imports = [
        #self.inputs.age.homeManagerModule.default
        #self.inputs.gpg.homeManagerModule.default
        #self.inputs.sops.homeManagerModule.default
        self.inputs.ssh.homeManagerModule.default
      ];
    };
    homeManagerModule.cryptMode = { config, pkgs, ... }: {
      imports = [
        self.inputs.age.homeManagerModule.default
        self.inputs.gpg.homeManagerModule.default
        self.inputs.sops.homeManagerModule.default
        self.inputs.ssh.homeManagerModule.default
      ];
    };
  };
}
