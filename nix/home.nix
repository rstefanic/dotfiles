{ pkgs, inputs, config, ... }:
let
  dotfilesPath = "${config.home.homeDirectory}/Code/dotfiles";
  outOfStoreSymlinkToDotfiles = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/${path}";
in
{
  programs.jujutsu.enable = true;

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
    amp-cli
    bun
    cargo
    claude-code
    coreutils
    direnv
    docker
    duckdb
    fd
    fzf
    gh
    go
    google-cloud-sdk
    helix
    lima
    lua
    ngrok
    nil
    nodejs
    nushell
    ollama
    opencode
    pnpm
    ripgrep
    tmux
    typescript-language-server
    inputs.sheets.packages.${pkgs.system}.default
    inputs.timer.packages.${pkgs.system}.default
  ];

  home.file.".config/ghostty/config".source = outOfStoreSymlinkToDotfiles "ghostty.config";
  home.file.".scripts".source = outOfStoreSymlinkToDotfiles ".scripts";
  home.file.".zshrc".source = outOfStoreSymlinkToDotfiles ".zshrc";
  home.file.".tmux.conf".source = outOfStoreSymlinkToDotfiles ".tmux.conf";
  home.file.".config/jj/config.toml".source = outOfStoreSymlinkToDotfiles "jujutsu.toml";
  home.file.".config/helix/config.toml".source = outOfStoreSymlinkToDotfiles "helix.toml";

  home.stateVersion = "24.11";
}
