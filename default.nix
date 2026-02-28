{
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
  dpkg,
  libxv,
  libxkbcommon,
}:
let
  build-date = "260225164";
  version = "5.7.8-beta";
  libs = [
    gtk3
    dpkg
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
  ];
in
stdenv.mkDerivation {
  name = "namida";
  inherit version;
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${build-date}/namida-v${version}.linux.deb";
    hash = "sha256-4QLGaHmdh1LNl5A4SJv405HdNqmcb8Mlw4vtlqXP0ks=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    wrapGAppsHook3
    makeWrapper
  ];

  buildInputs = libs;

  unpackPhase = ''
    dpkg -x $src .
  '';

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    cp usr/* $out -rv
    wrapProgram $out/namida/namida --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath libs}"
    mkdir $out/bin
    ln -s $out/namida/namida $out/bin/namida
    runHook postInstall
  '';
}
