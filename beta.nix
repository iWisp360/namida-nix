{
  callPackage,
  fetchurl,
  icon ? "default",
  ...
}:
let
  buildNumber = "261120140";
  version = "8.6.7-beta";
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildNumber}/namida-v${version}.linux.tar.gz";
    hash = "sha256-r6xn2IVdZNbg81x6jSAGUhYB9xe12bZrBHCxvRDVGnE=";
  };

  variant = "beta";
in
callPackage ./common.nix {
  inherit
    version
    variant
    src
    icon
    ;
}
