{
  stdenv,
  fetchurl,
  pkgs,
  ...
}:

stdenv.mkDerivation rec {
  pname = "tableplus";
  version = "6.6.5";

  src = fetchurl {
    name = "TablePlus.dmg";
    url = "https://tableplus.com/release/osx/tableplus_latest";
    hash = "sha256-ROI0a+PtIuqO90mCXzdlMen3PivzI9wjNku7Sn9DhGQ=";
  };

  nativeBuildInputs = with pkgs; [ makeWrapper _7zz ];

  sourceRoot = "TablePlus.app";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/{Applications/TablePlus.app,bin}
    cp -R . $out/Applications/TablePlus.app
    makeWrapper $out/Applications/TablePlus.app/Contents/MacOS/TablePlus $out/bin/${pname}
    runHook postInstall
  '';

  meta = {
    description = "Modern, Native Tool for Database Management";
    homepage = "https://tableplus.com/";
  };
}
