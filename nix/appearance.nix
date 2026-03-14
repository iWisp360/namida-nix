{
  types,
  mkOption,
}:
mkOption {
  default = { };
  type = types.submodule {
    options = {
      mode = mkOption {
        type = types.strMatching "(dark|light|system)";
        default = "system";
      };

      forceMiniPlayerFollowTrackColors = mkOption {
        type = types.bool;
        default = false;
        description = "Whether miniplayer should take track's artwork colors";
      };

      pitchBlack = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to set pitch black background";
      };

      autoColor = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to automatically pick player colors from music's artwork";
      };

      animatedTheme = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to animate theme";
      };

      staticColors = mkOption {
        default = { };
        description = "Set a color to be used by the player. Used if autoColor.enable is set to false";
        type = types.submodule {
          options = {
            light = mkOption {
              type = types.strMatching "^#[A-Fa-f0-9]{8}$";
              default = "#9c99c1ff";
              description = "Hexadecimal hash representing a color in rgba format";
            };

            dark = mkOption {
              type = types.strMatching "^#[A-Fa-f0-9]{8}$";
              default = "#4e4c72ff";
              description = "Hexadecimal hash representing a color in rgba format";
            };
          };
        };
      };
    };
  };
}
