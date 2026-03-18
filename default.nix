{
  stdenv,
  fetchurl,
  fetchgit,
  autoPatchelfHook,
  wrapGAppsHook3,
  makeWrapper,
  audiowaveform,
  ffmpeg,
  mpv-unwrapped,
  cairo,
  gdk-pixbuf,
  gtk3,
  libz,
  pango,
  harfbuzz,
  libcxx,
  dbus,
  lib,
  unar,
  icon ? "default",
  libwpe,
  libsoup_3,
  libsecret,
  callPackage,
}:
let
  buildId = "260319033";
  version = "5.8.5-beta";
  iconsUrl = "https://codeberg.org/iWisp360/namida-icons";
  icons = fetchgit {
    url = "${iconsUrl}";
    sha256 = "sha256-FlH4WAQO35FVT775KApVi41ayg4wiuT/CvPNsC7/PDY=";
  };

  wpewebkit = callPackage ./wpewebkit.nix { };
in
stdenv.mkDerivation {
  name = "namida";
  inherit version;
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildId}/namida-v${version}.linux.tar.gz";
    hash = "sha256-5aDau+QMdcilts4OQGAAccCZHUOdY99+tTOkqdifZcY=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    wrapGAppsHook3
    makeWrapper
  ];

  buildInputs = [
    mpv-unwrapped
    cairo
    gdk-pixbuf
    gtk3
    dbus
    libz
    pango
    harfbuzz
    libcxx
    unar
    libwpe
    audiowaveform
    ffmpeg
    libsoup_3
    libsecret
    wpewebkit
  ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/{bin,lib}
    cp * $out -rv
    rm -r $out/bin/*
    ln -s $out/namida_bin $out/bin/namida
    mkdir -p $out/share/icons/hicolor/{128x128,256x256,512x512}/apps
    rm $out/share/icons/namida.png
    if [ "${icon}" = "default" ]; then
      mv $out/share/icons/namida_128.png $out/share/icons/hicolor/128x128/apps/namida.png
      mv $out/share/icons/namida_256.png $out/share/icons/hicolor/256x256/apps/namida.png
      mv $out/share/icons/namida_512.png $out/share/icons/hicolor/512x512/apps/namida.png
    else
      rm $out/share/icons/namida_128.png
      rm $out/share/icons/namida_256.png
      rm $out/share/icons/namida_512.png

      unar ${icons}/${icon}.tar.xz

      mv ${icon}/namida_icon_${icon}.128.png $out/share/icons/hicolor/128x128/apps/namida.png
      mv ${icon}/namida_icon_${icon}.256.png $out/share/icons/hicolor/256x256/apps/namida.png
      mv ${icon}/namida_icon_${icon}.512.png $out/share/icons/hicolor/512x512/apps/namida.png
    fi

    runHook postInstall
  '';

  meta = {
    description = "A Beautiful and Feature-rich Music & Video Player with Youtube Support, Built in Flutter";
    homepage = "https://github.com/namidaco/namida";
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    mainProgram = "namida";
    maintainers = with lib.maintainers; [
      iwisp360
    ];

    license = {
      shortName = "EULA";
      url = "https://github.com/namidaco/namida/blob/main/README.md";
      fullName = "End User License Agreement";
      free = false;
      redistributable = false;
    };

    platforms = [
      "x86_64-linux"
    ];
  };
}
