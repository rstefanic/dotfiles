{ self, user, pkgs, config, ... }:

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
      "easy-move-plus-resize"
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

  environment.systemPackages = [
    (pkgs.callPackage ./custom-darwin/tableplus.nix {})
    (pkgs.callPackage ./custom-darwin/love.nix {})
    (pkgs.callPackage ./custom-darwin/aseprite.nix {})
  ];

  system = {
    primaryUser = "robert";

    defaults = {
      dock.autohide = true;
      NSGlobalDomain.AppleShowAllExtensions = true;
    };

    activationScripts.applications.text = let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = [ "/Applications" "/Applications/Nix\ Apps/" ];
      };
    in pkgs.lib.mkForce ''
      echo "configuring spotlight for custom Darwin installations..."
      find ${env}/Applications/ -maxdepth 1 -type l -exec sh -c '
        src="$(/usr/bin/stat -f%Y "$1")"
        appname=$(basename "$src")
        echo "$src"
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$appname"
      ' sh {} \;
    '';

    # Set Git commit hash for darwin-version.
    configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 5;
  };

}
