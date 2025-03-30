{
  description = "nix-darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, nix-homebrew, ... }:
  let user = "robert"; in
  {
    darwinConfigurations."Roberts-MacBook-Air" = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      specialArgs = {
        inherit self user;
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          hostPlatform = system;
        };
      };
      modules = [
        ./darwin.nix

        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = import ./home.nix;
        }

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
        inherit self;
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          hostPlatform = system;
        };
      };
      modules = [
        ./darwin.nix

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
