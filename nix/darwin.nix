{ self, user, pkgs, ... }:

{
  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    casks = [
      "1password"
      "discord"
      "firefox"
      "google-chrome"
      "rectangle"
      "slack"
      "spotify"
      "stats"
    ];
    masApps = {
      "Goodnotes" = 1444383602;
      "Todoist" = 585829637;
      "UTM" = 1538878817;
    };
  };

  nix = {
    linux-builder = {
      enable = true;
      ephemeral = true;
      maxJobs = 4;
      config = {
        virtualisation = {
          darwin-builder = {
            diskSize = 30 * 1024;
            memorySize = 4 * 1024;
          };
          cores = 4;
        };
      };
    };

    settings = {
      trusted-users = ["@admin"];
      experimental-features = "nix-command flakes";
    };

    extraOptions = ''
      builders-use-substitutes = true
    '';
  };

  system = {
    primaryUser = "robert";

    defaults = {
      dock.autohide = true;
      NSGlobalDomain.AppleShowAllExtensions = true;
    };

    # Set Git commit hash for darwin-version.
    configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 5;
  };

}
