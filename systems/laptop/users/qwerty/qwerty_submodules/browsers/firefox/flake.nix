#firefox.nix
{
  description = "firefox home-manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    homeManager.url = "github:nix-community/home-manager/release-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    homeManagerModule.default = { config, pkgs, ... }: {
      /*home.sessionVariables = {
        MOZILLA_HOME = "${config.xdg.configHome}/mozilla";  # this doesn't work, let's press F to pay respects...
      };*/
      programs.firefox = {
        enable = true;
   
        profiles.default = {
          settings = {
            "browser.newtabpage.activity-stream.showSponsored" = false;           # disable ads
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "extensions.pocket.enabled" = false;                                  # disable Pocket
            "browser.newtabpage.activity-stream.feeds.snippets" = false;          # disable snippets
            "browser.newtabpage.activity-stream.feeds.system.topstories" = false;

            "ui.systemUsesDarkTheme" = 1;                            # dark mode firefox UI
            "layout.css.prefers-color-scheme.content-override" = 0;  # dark mode for websites

            "identity.fxaccounts.enabled" = true;      #firefox sync
            "identity.fxaccounts.autoconnect" = true;
            "services.sync.enabled" = true;
            "services.sync.autoconnect" = true;
          };
        };
      };    
    };
  };
}
