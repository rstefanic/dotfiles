{ config, pkgs, ... }:

{
    time.timeZone = "America/Chicago";

    networking.hostName = "Snorlax";
    networking.firewall.enable = true;

    nixpkgs.config.allowUnfree = true;

    nix.trustedUsers = [ "@wheel" ];

    users.users = {
        rstefanic = {
            isNormalUser = true;
            home = "/home/rstefanic";
            description = "Robert Stefanic";
            extraGroups = [ "wheel" ];
            uid = 10000;
            shell = pkgs.zsh;
        };
    };
}
