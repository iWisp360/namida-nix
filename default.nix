{
  callPackage,
  fetchurl,
  ...
}:
let
  version = "8.6.7";
  src = fetchurl {
    url = "https://github.com/namidaco/namida/releases/download/v${version}/namida-v${version}.linux.tar.gz";
    hash = "sha256-jK25vXgHUWd9Aeq9Msc9dOfakVNSf7d3U8Qy6XEQ2u4=";
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
