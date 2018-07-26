{ lib , pkgs, ...} :

{

  #-----------------------------------
  # DEVELOPMENT
  #-----------------------------------

  environment.systemPackages = 
  [
    pkgs.ghc                # To Compile Haskell
    pkgs.git                # Git
    pkgs.cabal2nix          # To convernt cabal files to nix expressions
    pkgs.nix-prefetch-git   # Prefech nix expressions from git
    pkgs.cabal-install      # Cabal Install
    pkgs.gcc                # GCC compiler
  ];

}
