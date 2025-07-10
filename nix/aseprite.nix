{ pkgs ? import <nixpkgs> {} }:

let
  skia = pkgs.stdenv.mkDerivation {
    pname   = "skia";
    version = "m124";

    src = pkgs.fetchurl {
      name = "Skia-macOS-Release-arm64.zip";
      url  = "https://github.com/aseprite/skia/releases/download/m124-08a5439a6b/Skia-macOS-Release-arm64.zip";
      hash = "sha256-ImYwAJZ/wsPxp4GQCCIoR0lV3gL/0To1KzmkiyBNrJo=";
    };
    
    buildInputs = with pkgs; [ _7zz libjpeg libjpeg_turbo ];

    unpackPhase = ''
      runHook preUnpack
      ${pkgs.p7zip}/bin/7z x $src
      runHook postUnpack
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -R . $out
      runHook postInstall
    '';
  };
in pkgs.stdenv.mkDerivation {
  name = "aseprite";

  src = pkgs.fetchFromGitHub {
    owner = "aseprite";
    repo  = "aseprite";
    rev   = "2d87a7b1843720902b2db52694b16aa2f91c20b7";
    hash  = "sha256-k3LBW1/MydK9Oafz1ezAYCy+LSKzjNiAznxONWZY/bo=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = with pkgs; [ cmake ninja pkg-config darwin.xcode_16_3 ];

  cmakeFlags = [
    "-DENABLE_DESKTOP_INTEGRATION=ON"
    "-DENABLE_UPDATER=OFF"
    "-DCMAKE_BUILD_TYPE=RelWithDebInfo"
    "-DCMAKE_OSX_ARCHITECTURES=arm64"
    "-DCMAKE_OSX_DEPLOYMENT_TARGET=11.0"

    # TODO: Reference Apple clang compiler from the nix store
    "-DCMAKE_OSX_SYSROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
    "-DCMAKE_CXX_COMPILER=/Library/Developer/CommandLineTools/usr/bin/clang++"

    # UI Backend w/ asesprite build of skia
    "-DLAF_BACKEND=skia"
    "-DLAF_WITH_EXAMPLES=OFF"
    "-DLAF_WITH_TESTS=OFF"
    "-DSKIA_DIR=${skia}"
    "-DSKIA_LIBRARY_DIR=${skia}/out/Release-arm64"
    "-DSKIA_LIBRARY=${skia}/out/Release-arm64/libskia.a"
    "-DPNG_ARM_NEON:STRING=on"

    # https://github.com/NixOS/nixpkgs/issues/144170
    "-DCMAKE_INSTALL_INCLUDEDIR=include"
    "-DCMAKE_INSTALL_LIBDIR=lib"
    "-G Ninja"
  ];

  postInstall = ''
    rm -rf "$out"/{include,lib,man}
    mv "$out"/share/aseprite/data "$out"/bin
  '';

  meta = {
    homepage = "https://www.aseprite.org/";
    description = "Animated sprite editor & pixel art tool";
    license = pkgs.lib.licenses.unfree;
    longDescription = ''
      Aseprite is a program to create animated sprites. Its main features are:

                - Sprites are composed by layers & frames (as separated concepts).
                - Supported color modes: RGBA, Indexed (palettes up to 256 colors), and Grayscale.
                - Load/save sequence of PNG files and GIF animations (and FLC, FLI, JPG, BMP, PCX, TGA).
                - Export/import animations to/from Sprite Sheets.
                - Tiled drawing mode, useful to draw patterns and textures.
                - Undo/Redo for every operation.
                - Real-time animation preview.
                - Multiple editors support.
                - Pixel-art specific tools like filled Contour, Polygon, Shading mode, etc.
                - Onion skinning.
    '';
    # platforms = pkgs.lib.platforms.aarch64-darwin;
  };
}
