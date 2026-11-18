{
  callPackage,
  fetchurl,
  ...
}:
let
  buildNumber = "261114224";
  version = "8.6.5-beta";
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildNumber}/namida-v${version}.linux.tar.gz";
    hash = "sha256-iSruMIG0FB8my1c9m3p131ne+7djEUpS1ZW5jKW2nP4=";
  };

  variant = "beta";
in
callPackage ./common.nix {
  inherit
    version
    variant
    src
    ;
}
