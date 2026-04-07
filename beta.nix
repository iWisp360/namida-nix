{
  callPackage,
  fetchurl,
  ytLoginSupport ? false,
  wpewebkit ? null,
  ...
}:
let
  buildNumber = "260407098";
  version = "5.9.5-beta";
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildNumber}/namida-v${version}${
      if ytLoginSupport then "_login" else ""
    }.linux.tar.gz";
    hash =
      if ytLoginSupport then
        "sha256-dYGZwJiWXOgPfqB3aLwtiC53ZMBkXQjkJ+5Y6fG3F1s="
      else
        "sha256-c2kLdamJdKB2fF6EXVqPQaZGi9y1fPACpBxjjLkmYls=";
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
