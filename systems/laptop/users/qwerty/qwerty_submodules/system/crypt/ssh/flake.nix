#ssh.nix
{
  description = "ssh-agent home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        openssh
      ];
 
      #https://nix-community.github.io/home-manager/options.xhtml#opt-programs.ssh.enable
      programs.ssh = {
        enable = true;
        extraConfig = ''
          IdentityFile ~/.ssh/id_ed25519
          AddKeysToAgent yes
        '';
      };    

      services.ssh-agent.enable = true;
     /*
      # PROBLEM: HOME-MANAGER CREATES A SYMLINK FROM STORE TO THE LOCATION WITH home.file.<name>

      # SOLUTION: RUN A BASH TO COPY THE FILE FROM THE SYMLINK AND DELETE THE SYMLINK :)
      home.file.".ssh/temp_secret_ssh_key" = {
        
        source = ./id_ed25519;
        #source = /home/qwerty/.dotfiles/systems/laptop/users/qwerty/qwerty_submodules/system/crypt/ssh/id_ed25519;
        onChange = ''                                        # onChange RUNS ONLY WHEN FILE IS NOT THERE, WHICH IS PERFECT BECAUSE IT
          cat ~/.ssh/temp_secret_ssh_key > ~/.ssh/id_ed25519 # MEANS THAT WE ARE NOT COPYING IT EVERYTIME nixos-rebuild IS RAN :)
          chmod 0600 ~/.ssh/id_ed25519
          rm ~/.ssh/temp_secret_ssh_key
        '';
      };*/
    };
  };
}
