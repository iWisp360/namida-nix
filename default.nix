{
  callPackage,
  fetchurl,
  ytSupport ? false,
  wpewebkit ? null,
  ...
}:
let
  buildNumber = "260324012";
  version = "5.8.7-beta";
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildNumber}/namida-v${version}${
      if ytSupport then "_login" else ""
    }.linux.tar.gz";
    hash =
      if ytSupport then
        "sha256-ldIXM3SCIUB3VnLYuCl7/xzokS65O28UdpmWhVkUJ3s="
      else
        "sha256-eQyTs11l8K8WF75RvAFKg+k77P32t2VUfRB2YJWFi9Y=";
  };

  variant = "stable";
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
