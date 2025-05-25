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

  system.defaults = {
    dock.autohide = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
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

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
