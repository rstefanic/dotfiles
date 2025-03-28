{ self, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    _1password-cli
    cargo
    direnv
    docker
    fzf
    git
    ollama
    neovim
    nil
    ngrok
    ripgrep
    tmux
    nodejs
  ];

  homebrew = {
    enable = true;
    casks = [
      "stats"
    ];
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
