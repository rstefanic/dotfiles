{ lib , pkgs, ...} :

{

  #-----------------------------------
  # DEVELOPMENT
  #-----------------------------------

  environment.systemPackages = 
  [
    pkgs.ghc
    pkgs.git
    pkgs.cabal2nix
    pkgs.nix-prefetch-git
    pkgs.cabal-install
    pkgs.gcc
  ];

}
