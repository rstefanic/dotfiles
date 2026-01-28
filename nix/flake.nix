{
  description = "nix-darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    timer.url = "github:rstefanic/timer/main";
    jujutsu.url = "github:martinvonz/jj";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, nix-homebrew, ... }:
  let
      user = "robert";
      homeManagerConfig = {
        home-manager.extraSpecialArgs = { inherit inputs; };
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${user} = import ./home.nix;
      };
      overlays = [
        inputs.jujutsu.overlays.default
        (final: prev: {
          duckdb = prev.duckdb.overrideAttrs (previousAttrs: rec {
            version = "1.4.1";
            src = prev.fetchFromGitHub {
              owner = "duckdb";
              repo = "duckdb";
              rev = "${version}";
              sha256 = "sha256-w/mELyRs4B9hJngi1MLed0fHRq/ldkkFV+SDkSxs3O8=";
            };
          });
        })
        (final: prev: {
          lima = (import inputs.nixpkgs-unstable {
            system = prev.system;
            config = prev.config;
          }).lima;
          claude = (import inputs.nixpkgs-unstable {
            system = prev.system;
            config = prev.config;
          }).claude;
          bun = (import inputs.nixpkgs-unstable {
            system = prev.system;
            config = prev.config;
          }).bun;
        })
      ];
  in
  {
    darwinConfigurations."Roberts-MacBook-Air" = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      specialArgs = {
        inherit self user;
        pkgs = import nixpkgs {
          inherit system overlays;
          config.allowUnfree = true;
          hostPlatform = system;
        };
      };
      modules = [
        ./darwin.nix
        home-manager.darwinModules.home-manager homeManagerConfig
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            inherit user;
            enable = true;
            enableRosetta = true;
            autoMigrate = true;
          };
        }
      ];
    };

    darwinConfigurations."intel" = nix-darwin.lib.darwinSystem rec {
      system = "x86_64-darwin";
      specialArgs = {
        inherit self user;
        pkgs = import nixpkgs {
          inherit system overlays;
          config.allowUnfree = true;
          hostPlatform = system;
        };
      };
      modules = [
        ./darwin.nix
        home-manager.darwinModules.home-manager homeManagerConfig
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            inherit user;
            enable = true;
            autoMigrate = true;
          };
        }
      ];
    };
  };
}
