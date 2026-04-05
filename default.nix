{
  callPackage,
  fetchurl,
  ytLoginSupport ? false,
  wpewebkit ? null,
  ...
}:
let
  buildNumber = "260405059";
  version = "5.9.4-beta";
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildNumber}/namida-v${version}${
      if ytLoginSupport then "_login" else ""
    }.linux.tar.gz";
    hash =
      if ytLoginSupport then
        "sha256-gnOpwp/NSSXbx4ZYyc7hH9sn14aJ1r4qNi8junhFr9Y="
      else
        "sha256-cnKLebSmPToFD6QIOAFqtWICmpDLfZBhi6r6QAFApAM=";
  };

  variant = "stable";
in
callPackage ./common.nix {
  inherit
    version
    ytLoginSupport
    wpewebkit
    variant
    src
    ;
}
