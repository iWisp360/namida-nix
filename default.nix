{
  callPackage,
  fetchurl,
  ...
}:
let
  buildNumber = "260919170";
  version = "7.1.2-beta";
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildNumber}/namida-v${version}.linux.tar.gz";
    hash = "sha256-nOtumEm9dTV5bQBq/e3JsIi4f871a2Eg6LXI4Gp3DgI=";
  };

  variant = "stable";
in
callPackage ./common.nix {
  inherit
    version
    variant
    src
    ;
}
