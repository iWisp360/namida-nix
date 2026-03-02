{
  freetype,
  bzip2,
  audiowaveform,
  ffmpeg,
  libpng,
  brotli,
  fontconfig,
  expat,
  fribidi,
  libepoxy,
  libxi,
  libxext,
  libxau,
  libxdmcp,
  dbus,
  systemdLibs,
  libcloudproviders,
  tinysparql,
  json-glib,
  libxml2,
  icu,
  sqlite,
  libxfixes,
  wayland,
  libffi,
  libxcursor,
  libxrender,
  libxdamage,
  libxcomposite,
  libxrandr,
  libxinerama,
  zlib,
  libglycin,
  lcms2,
  libseccomp,
  atk,
  libthai,
  libdatrie,
  pixman,
  graphite,
  util-linux,
  pcre2,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  gtk3,
  pango,
  cairo,
  at-spi2-core,
  glib,
  gdk-pixbuf,
  harfbuzz,
  mpv,
  wrapGAppsHook3,
  makeWrapper,
  mesa,
  libX11,
  flac,
  libvorbis,
  pipewire,
  libGL,
  libglvnd,
  lib,
  libxcb,
  libxv,
  libxkbcommon,
}:
let
  build-date = "260225164";
  version = "5.7.8-beta";
  libs = [
    gtk3
    pango
    cairo
    at-spi2-core
    glib
    mpv
    gdk-pixbuf
    harfbuzz
    mesa
    libX11
    libxcb
    libxv
    flac
    libvorbis
    libGL
    libglvnd
    pipewire
    libxkbcommon
    freetype
    bzip2
    libpng
    brotli
    fontconfig
    expat
    fribidi
    libepoxy
    libxi
    libxext
    libxau
    libxdmcp
    dbus
    systemdLibs
    libcloudproviders
    tinysparql
    json-glib
    libxml2
    icu
    sqlite
    libxfixes
    wayland
    libffi
    libxcursor
    libxrender
    libxdamage
    libxcomposite
    libxrandr
    libxinerama
    zlib
    libglycin
    lcms2
    libseccomp
    atk
    libthai
    libdatrie
    pixman
    graphite
    util-linux
    pcre2
  ];
in
stdenv.mkDerivation {
  name = "namida";
  inherit version;
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${build-date}/namida-v${version}.linux.tar.gz";
    hash = "sha256-g6csh0n32zlkTFGfqsm9cCYt9JYSWglRUtJoXJMXsVw=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    wrapGAppsHook3
    makeWrapper
  ];

  buildInputs = libs;

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/{bin,lib}
    cp * $out -rv
    rm -r $out/bin/*
    mv namida $out
    wrapProgram $out/namida --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath libs}"
    ln -s $out/namida $out/bin/namida
    ln -s ${audiowaveform}/bin/audiowaveform $out/bin/audiowaveform
    ln -s ${ffmpeg}/bin/ffprobe $out/bin/ffprobe
    ln -s ${ffmpeg}/bin/ffmpeg $out/bin/ffmpeg
    runHook postInstall
  '';

  meta = {
    description = "A Beautiful and Feature-rich Music & Video Player with Youtube Support, Built in Flutter";
    homepage = "https://github.com/namidaco/namida";
    license = {
      shortName = "Namida EULA";
      url = "https://github.com/namidaco/namida/blob/main/README.md";
      fullName = "Namida End User License Agreement (EULA)";
      free = false;
      redistributable = false;
    };

    platforms = [
      "x86_64-linux"
    ];
  };
}
