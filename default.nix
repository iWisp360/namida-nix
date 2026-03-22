{ callPackage, fetchurl, ... }@args:
let
  buildId = "260213222";
  version = "5.7.2-beta";
in
callPackage ./common.nix {
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildId}/namida-v${version}.linux.tar.gz";
    hash = "sha256-/4YfGraIYUWBdqR9GKCfIXQXRK/ncNjQL06BfGUbLlg=";
  };

  variant = "stable";
  inherit version;
}
// args
