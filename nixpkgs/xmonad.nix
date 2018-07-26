{ lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.haskellPackages.xmobar
    pkgs.haskellPackages.xmonad
    pkgs.dmenu
  ];

  services.xserver = { 
    windowManager.default = "xmonad";
    windowManager.xmonad = { 
      enable = true;
      enableContribAndExtras = true;
    };
  };
}
