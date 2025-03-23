{
  description = "nix-darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = { self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    user = "robert";

    configuration = arch: { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = with pkgs; [
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

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      nixpkgs.hostPlatform = arch;
    };
  in
  {
    darwinConfigurations."m3" = nix-darwin.lib.darwinSystem {
      modules = [
        (configuration "aarch64-darwin")
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            inherit user;
            autoMigrate = true;
          };
        }
      ];
    };

    darwinConfigurations."intel" = nix-darwin.lib.darwinSystem {
      modules = [
        (configuration "x86_64-darwin")
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            inherit user;
          };
        }
      ];
    };
  };
}
