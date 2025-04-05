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

  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = [
      (pkgs.tmuxPlugins.mkTmuxPlugin {
        pluginName = "tpm";
        name = "tpm";
        src = pkgs.fetchFromGitHub {
          owner = "tmux-plugins";
          repo = "tpm";
          rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
          hash = "sha256-hW8mfwB8F9ZkTQ72WQp/1fy8KL1IIYMZBtZYIwZdMQc=";
        };
      })
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
