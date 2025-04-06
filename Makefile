vm:
	nix run 'nixpkgs#darwin.linux-builder'

update:
	nix flake update --flake ./nix

gc:
	nix-collect-garbage --delete-old
