{
  callPackage,
  fetchurl,
  ytSupport ? false,
  wpewebkit ? null,
  ...
}:
let
  buildNumber = "260331152";
  version = "5.9.1-beta";
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildNumber}/namida-v${version}${
      if ytSupport then "_login" else ""
    }.linux.tar.gz";
    hash =
      if ytSupport then
        "sha256-yphTbAzX/akewb4ll55gGt/TgZe6rafmaP+hkctsXH4="
      else
        "sha256-jUEsAXAOJgxn0fi6DWgCIjFNmEbIRMSu4ge0sViU8wU=";
  };

  variant = "beta";
in
callPackage ./common.nix {
  inherit
    version
    ytSupport
    wpewebkit
    variant
    src
    ;
}
