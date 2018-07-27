{ lib, pkgs, ... }:

#-----------------------------------
# AUDIO
#-----------------------------------

{
  environment.systemPackages = 
  [ 
    pkgs.lsof       # To view sound devices
    pkgs.spotify    # To listen to music
  ];

  sound.enable = true;

  hardware = {
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
  };
}
