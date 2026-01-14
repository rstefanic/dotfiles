{
  stdenv,
  fetchurl,
  pkgs,
  ...
}:

stdenv.mkDerivation rec {
  pname = "love";
  version = "11.5";

  src = fetchurl {
    name = "love.dmg";
    url = "https://github.com/love2d/love/releases/download/11.5/love-11.5-macos.zip";
    hash = "sha256-Z5W7OhZWr2ov3+dB4VB4e0gYhtOigDJ6Jho/3e1YaRM=";
  };

  nativeBuildInputs = with pkgs; [ makeWrapper _7zz ];

  sourceRoot = "love.app";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/{/Applications/love.app,bin}
    cp -R . $out/Applications/love.app
    makeWrapper $out/Applications/love.app/Contents/MacOS/love $out/bin/${pname}
    runHook postInstall
  '';

  meta = {
    description = ''
      LÖVE is an *awesome* framework you can use to make 2D games in Lua. 
      It's free, open-source, and works on Windows, macOS, Linux, Android and iOS.
    '';
    homepage = "https://love2d.org";
  };
}
