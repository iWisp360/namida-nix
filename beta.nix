{
  callPackage,
  fetchurl,
  ytLoginSupport ? false,
  wpewebkit ? null,
  ...
}:
let
  buildNumber = "260501142";
  version = "6.0.6-beta";
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildNumber}/namida-v${version}${
      if ytLoginSupport then "_login" else ""
    }.linux.tar.gz";
    hash =
      if ytLoginSupport then
        "sha256-siXF+nM6wCHa5WQhgBDQEGnxhCYdPeQy7bJuBMpyQp8="
      else
        "sha256-d7Y31eBGE6rowY581Cx2XTGQsnF7Ob5ffCkjQMBYSCQ=";
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
