{ config, pkgs, ... }:

# ------------------------------------
# XMONAD
# ------------------------------------

{
  services.xserver.windowManager.xmonad = {
    enable = true;
    extraPackages = haskellPackages: with haskellPackages; [
      xmonad-contrib xmonad-extras
    ];
  };

  environment.systemPackages = [
    pkgs.dmenu
  ];

}
