{
  stdenv,
  fetchurl,
  cmake,
  python3,
  perl,
  ruby,
  glib,
  harfbuzzFull,
  libjpeg,
  libepoxy,
  libgcrypt,
  libgpg-error,
  libtasn1,
  libxkbcommon,
  pkg-config,
  libxml2,
  libpng,
  sqlite,
  unifdef,
  libwebp,
  libwpe,
  gobject-introspection,
  gi-docgen,
  libsoup_3,
  atk,
  flite,
  libjxl,
  woff2,
  libxslt,
  libavif,
  systemdLibs,
  libcap,
  lcms,
  libdrm,
  libgbm,
  libbacktrace,
  libseccomp,
  bubblewrap,
  xdg-dbus-proxy,
  gst_all_1,
  gperf,
  freetype,
  fontconfig,
  libsysprof-capture,
}:
stdenv.mkDerivation {
  name = "wpewebkit";
  src = fetchurl {
    url = "https://wpewebkit.org/releases/wpewebkit-2.50.6.tar.xz";
    sha256 = "sha256-iGT9P2EWNw11Ql+bHvpI6xiMz0LJKunoqvLdUfnyfe8=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    python3
    perl
    ruby
    glib
    harfbuzzFull
    libjpeg
    libepoxy
    libgcrypt
    libgpg-error
    libtasn1
    libxkbcommon
    libxml2
    libpng
    sqlite
    unifdef
    libwebp
    libwpe
    gobject-introspection
    gi-docgen
    libsoup_3
    atk
    flite
    libjxl
    woff2
    libxslt
    libavif
    systemdLibs
    libcap
    lcms
    libdrm
    libgbm
    libbacktrace
    libseccomp
    bubblewrap
    xdg-dbus-proxy
    gst_all_1.gst-plugins-base
    gperf
    freetype
    fontconfig
    libsysprof-capture
  ];

  cmakeFlags = [
    "-DPORT=WPE"
  ];
}
