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
}:
let
  buildId = "260213222";
  iconsUrl = "https://codeberg.org/iWisp360/namida-icons";
  icons = fetchgit {
    url = "${iconsUrl}";
    rev = "021b2f4f80e4752c5a38822b80db128931024ed5";
    hash = "sha256-Q4Jd5n6aIfRakJTr+K7lrbOPADdiMz29InAkUwBoFac=";
  };
in
stdenv.mkDerivation (finalAttrs: {
  name = "namida";
  pname = "namida${if icon != "default" then "-${icon}" else ""}";
  version = "5.7.2-beta";
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${finalAttrs.version}%2B${buildId}/namida-v${finalAttrs.version}.linux.tar.gz";
    hash = "sha256-/4YfGraIYUWBdqR9GKCfIXQXRK/ncNjQL06BfGUbLlg=";
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
  ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/{bin,lib}
    cp * $out -rv
    rm -r $out/bin/*
    mv namida $out
    ln -s $out/namida $out/bin/namida
    ln -s ${audiowaveform}/bin/audiowaveform $out/bin/audiowaveform
    ln -s ${ffmpeg}/bin/ffprobe $out/bin/ffprobe
    ln -s ${ffmpeg}/bin/ffmpeg $out/bin/ffmpeg
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
})
