#user_home-manager.nix
{
  description = "user home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    homeManager.url = "github:nix-community/home-manager/release-24.11";
    #misc.url = "path:./misc"; << EXAMPLE
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { pkgs, username, ... }:    
    {
        home.username = nixpkgs.lib.mkForce(username);
        home.homeDirectory = "/home/${username}";
        home.stateVersion = "24.11";
        programs.bash.enable = true;

        imports = [
          #self.inputs.misc.homeManagerModule.neofetch
        ];
    };
  };
}
