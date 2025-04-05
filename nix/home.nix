{ pkgs, inputs, config, ... }:
let
  outOfStoreSymlink = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Code/dotfiles/${path}";
in
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

  home.file.".config/nvim".source = outOfStoreSymlink "nvim";
  home.file.".config/ghostty/".source = outOfStoreSymlink "ghostty";
  home.file.".scripts".source = outOfStoreSymlink ".scripts";
  home.file.".zshrc".source = outOfStoreSymlink ".zshrc";
  home.file.".tmux.conf".source = outOfStoreSymlink "tmux/.tmux.conf";

  home.stateVersion = "24.11";
}
