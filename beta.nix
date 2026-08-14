{
  callPackage,
  fetchurl,
  ytLoginSupport ? false,
  wpewebkit ? null,
  ...
}:
let
  buildNumber = "260802156";
  version = "6.4.2-beta";
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildNumber}/namida-v${version}${
      if ytLoginSupport then "_login" else ""
    }.linux.tar.gz";
    hash =
      if ytLoginSupport then
        "sha256-f7OzwcNYmMDRwVKgMscgXt2q44Npwi5eGBbOjKyaIys="
      else
        "sha256-Gww11CBeNhZa08NjixPTmkP4gUajGIi363O8GZHKr5w=";
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
