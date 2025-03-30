{ pkgs, ... }:

{
  home.packages = with pkgs; [
    _1password-cli
    cargo
    docker
    direnv
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

  home.stateVersion = "24.11";
}
