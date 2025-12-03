TODO

home.file.".dotfiles" = {
  source = ./.; # path inside the flake to copy
  recursive = true; # copy subdirectories
};



make the .dotfiles copy theirselves into $user/.dotfiles




create a script to make 

sudo nixos flake build

sudo nixos flake check

easier to run

also prevent from running

sudo nixos-rebuild switch --flake .#guest@laptop

while qwerty user is running (boot should be done instead)



set up XDG paths to de-pollute $HOME



IMPORTANT:

START MANAGING GARBAGE (old builds)
sudo nix-collect-garbage --delete-older-than 5d
