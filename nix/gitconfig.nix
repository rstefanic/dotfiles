{ lib, ... }:
let 
  baseConfig = {
    user = {
      email = "rstefanic72@gmail.com";
      name = "Robert Stefanic";
    };
    alias = {
      l = "!. ~/.scripts/githelpers && pretty_git_log";
      la = "!git l --all";
      lr = "!git l -30";
      lra = "!git lr --all";
      lg = "!git l -G $1 -- $2";
    };
    core = {
      editor = "nvim";
    };
    diff = {
      algorithm = "histogram";
    };
    commit = {
      verbose = "true";
    };
  };
  gpgConfig = lib.optionalAttrs (builtins.pathExists ./git-gpg.nix) (import ./git-gpg.nix);
in
lib.recursiveUpdate baseConfig gpgConfig
