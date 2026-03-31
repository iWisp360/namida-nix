{
  callPackage,
  fetchurl,
  ytSupport ? false,
  wpewebkit ? null,
  ...
}:
let
  buildNumber = "260330235";
  version = "5.9.0-beta";
in
callPackage ./common.nix {
  inherit ytSupport wpewebkit;
  src = fetchurl {
    url = "https://github.com/namidaco/namida-snapshots/releases/download/${version}%2B${buildNumber}/namida-v${version}${
      if ytSupport then "_login" else ""
    }.linux.tar.gz";
    hash =
      if ytSupport then
        "sha256-Nnhb3mYdUKhwUbjppeAIJqg//Iuflc5U3DPZw/oaVOA="
      else
        "sha256-ShJrrV/KbxNNKvf3T/3jlTocWK0Wd9so3XaXJVT+Zf8=";
  };

  variant = "beta";
  inherit version;
}
