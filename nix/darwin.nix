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
      "spotify"
      "stats"
    ];
    masApps = {
      "Goodnotes" = 1444383602;
    };
  };

  system.defaults = {
    dock.autohide = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
  };

  nix.extraOptions = ''
    builders-use-substitutes = true
    extra-trusted-users = ${user}
  '';

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
