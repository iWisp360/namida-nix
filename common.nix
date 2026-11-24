{
  stdenv,
  fetchgit,
  autoPatchelfHook,
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
  icon,
  variant,
  version,
  src,
  libappindicator,
  libdbusmenu-gtk3,
  at-spi2-core,
  fontconfig,
  glib-networking,
  rustPlatform,
  gst_all_1,
  webkitgtk_4_1,
  libsoup_3,
  ...
}:
let
  rhttp =
    let
      src = fetchgit {
        url = "https://codeberg.org/MSOB7YY/rhttp";
        rev = "7a0fb576c7dc916e3671e164aec0c4bcf919bc08";
        hash = "sha256-d6TTr8MSDnIX7KT0ouEnUIYfoQvtEpeL1gffolXQvhE=";
      };

      manifest = (lib.importTOML "${src}/rhttp/rust/Cargo.toml").package;
    in
    rustPlatform.buildRustPackage {
      pname = manifest.name;
      inherit (manifest) version;
      src = src + "/rhttp/rust";
      cargoLock.lockFile = "${src}/rhttp/rust/Cargo.lock";
      RUSTFLAGS = "--cfg reqwest_unstable";
    };
  deps = [
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
    audiowaveform
    ffmpeg
    libappindicator
    libdbusmenu-gtk3
    makeWrapper
    at-spi2-core
    fontconfig
    glib-networking
    rhttp
    webkitgtk_4_1
    libsoup_3
  ];

  icons = fetchgit {
    url = "https://codeberg.org/iWisp360/namida-icons";
    rev = "b1619fe8ae9af791249647b6e11f009b711484a0";
    hash = "sha256-rvf0Jc70CCO3b2hJUV9eEOitbHSHkcAGsikwgYIXQCY=";
  };
in
stdenv.mkDerivation {
  name = "namida${if icon != "default" then "-${icon}" else ""}-${variant}";
  pname = "namida";
  inherit src version;

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = deps;

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,lib}
    cp * $out -rv

    ln -sv $out/namida $out/bin/namida
    ln -sfv ${rhttp}/lib/librhttp.so $out/lib/librhttp.so
    ln -sv ${audiowaveform}/bin/audiowaveform $out/bin/audiowaveform
    ln -sv ${ffmpeg}/bin/ffmpeg $out/bin/ffmpeg
    ln -sv ${ffmpeg}/bin/ffprobe $out/bin/ffprobe

    if ! [ "${icon}" = "default" ]; then
      unar ${icons}/${icon}.tar.xz

      mv ${icon}/namida_icon_${icon}.128.png $out/share/icons/hicolor/128x128/apps/namida.png
      mv ${icon}/namida_icon_${icon}.256.png $out/share/icons/hicolor/256x256/apps/namida.png
      mv ${icon}/namida_icon_${icon}.512.png $out/share/icons/hicolor/512x512/apps/namida.png
    fi

    runHook postInstall
  '';

  postFixup = ''
    wrapProgram $out/bin/namida \
      --set FONTCONFIG_FILE "${fontconfig.out}/etc/fonts/fonts.conf" \
      --set FONTCONFIG_PATH "${fontconfig.out}/etc/fonts" \
      --set GIO_EXTRA_MODULES "${glib-networking}/lib/gio/modules" \
      --set GST_PLUGIN_SYSTEM_PATH_1_0 "${gst_all_1.gstreamer}/lib/gstreamer-1.0:${gst_all_1.gst-plugins-base}/lib/gstreamer-1.0:${gst_all_1.gst-plugins-good}/lib/gstreamer-1.0" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath deps}:$out/lib"
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

    broken = false;
  };
}
