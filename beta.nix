{
  callPackage,
  fetchurl,
  ytLoginSupport ? false,
  wpewebkit ? null,
  ...
}:
let
  buildNumber = "260415083";
  version = "6.0.0-beta";
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildNumber}/namida-v${version}${
      if ytLoginSupport then "_login" else ""
    }.linux.tar.gz";
    hash =
      if ytLoginSupport then
        "sha256-ULHvRaYBKYWQVSZBGojpyPIWvIwTzp19HhRkD9q2a38="
      else
        "sha256-OVIYHrh5m1bjrA5Ot6XoUYEdVAkn2LRjMGM7G8zwZ4s=";
  };

  variant = "beta";
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
