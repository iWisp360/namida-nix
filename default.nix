{
  stdenv,
  fetchurl,
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
  ...
}:
let
  buildId = "260213222";
  version = "5.7.2-beta";
in
stdenv.mkDerivation rec {
  name = "namida";
  inherit version;
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildId}/namida-v${version}.linux.tar.gz";
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
    mv $out/share/icons/namida_128.png $out/share/icons/hicolor/128x128/apps/namida.png
    mv $out/share/icons/namida_256.png $out/share/icons/hicolor/256x256/apps/namida.png
    mv $out/share/icons/namida_512.png $out/share/icons/hicolor/512x512/apps/namida.png
    runHook postInstall
  '';

  meta = {
    description = "A Beautiful and Feature-rich Music & Video Player with Youtube Support, Built in Flutter";
    homepage = "https://github.com/namidaco/namida";
    # sourceProvenance = lib.sourceTypes.binaryNativeCode;
    mainProgram = "namida";
    #maintainers = with lib.maintainers; [
    #  iwisp360
    #];

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
