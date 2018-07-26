{ lib, pkgs, ... }:

{

  #-----------------------------------
  # AUDIO
  #-----------------------------------

  environment.systemPackages = 
  [ 
    pkgs.lsof
  ];

  sound.enable = true;

  hardware = {
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
  };

}
