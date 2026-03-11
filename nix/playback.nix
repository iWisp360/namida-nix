{
  types,
  mkOption,
  mkEnableOption,
}:
mkOption {
  type = types.submodule {
    options = {
      video = mkOption {
        type = types.submodule {
          enable = mkEnableOption "Whether to enable video playback";
          videoSource = mkOption { };
          videoQuality = mkOption { };
          localVideoMatching = mkOption { };
        };
      };
    };
  };
}
