linux-builder-check:
	launchctl list org.nixos.linux-builder

update:
	nix flake update --flake ./nix

gc:
	nix-collect-garbage --delete-old
