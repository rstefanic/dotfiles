{
  description = "nix-darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = { self, nix-darwin, nix-homebrew, ... }:
  let user = "robert"; in
  {
    darwinConfigurations."m3" = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      specialArgs = { inherit self system; };
      modules = [
        ./darwin-packages.nix

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
      specialArgs = { inherit self system; };
      modules = [
        ./packages.nix

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
