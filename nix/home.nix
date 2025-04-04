{ pkgs, inputs, ... }:

{
  programs.git = {
    enable = true;
    includes = [
      { contents = import ./gitconfig.nix { lib = pkgs.lib; }; }
    ];
  };

  home.packages = with pkgs; [
    _1password-cli
    cargo
    docker
    direnv
    fzf
    ollama
    neovim
    nil
    ngrok
    ripgrep
    tmux
    nodejs
    inputs.timer.packages.${pkgs.system}.default
  ];

  home.stateVersion = "24.11";
}
