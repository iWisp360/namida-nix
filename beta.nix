{ callPackage, fetchurl, ... }@args:
let
  buildId = "260319033";
  version = "5.8.5-beta";
in
callPackage ./common.nix (
  args
  // {
    src = fetchurl {
      url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildId}/namida-v${version}.linux.tar.gz";
      hash = "sha256-5aDau+QMdcilts4OQGAAccCZHUOdY99+tTOkqdifZcY=";
    };

    wpewebkit = callPackage ./wpewebkit.nix { };
    variant = "beta";
    inherit version;
  }
)
