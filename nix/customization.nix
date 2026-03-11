{
  types,
  mkOption,
  mkEnableOption,
}:
mkOption {
  type = types.submodule {
    options = {
      blur = mkEnableOption "Whether to enable blur";
      glow = mkEnableOption "Whether to enable glow";
      parallax = mkEnableOption "Whether to enable parallax";
      party = mkEnableOption "Whether to enable party effect";
      edgeColorsSwitching = mkEnableOption "Whether to switch colors in party effect";
      movingParticles = mkEnableOption "Whether to enable moving particles effect";

      borderRadius = mkOption {
        type = types.float;
        default = 1.0;
        description = "Multiplier for borders radius";
      };

      fontScale = mkOption {
        type = types.float;
        default = 0.9;
        description = "Define font size";
      };

      displayRemainingDuration = mkEnableOption "Whether to display remaining duration instead of total";

      displayActualPosition = mkEnableOption "Whether to display actual position instead of difference while seeking";

      albumTile = mkOption {
        type = types.submodule {
          options = {
            displayTrackNumber = mkEnableOption "Whether to display a small box containing the track number in the album page";
            topRightDate = mkEnableOption "Whether to display album date at Album Card's top right";
            staggeredGridview = mkEnableOption "Whether to add spacing to thumbnail for uniform arrangement";
            height = mkOption {
              type = types.int;
              default = 90;
              description = "Height for all album tiles";
            };

            thumbnails = mkOption {
              type = types.submodule {
                options = {
                  size = mkOption {
                    type = types.int;
                    default = 90;
                    description = "Size of album thumbails";
                  };

                  squared = mkEnableOption "Whether to force square album thumbnails";
                };
              };
            };
          };
        };
      };

      trackTile = mkOption {
        type = types.submodule {
          options = {
            height = mkOption {
              type = types.int;
              default = 90;
              description = "Height for all track tiles";
            };

            thumbnails = mkOption {
              type = types.submodule {
                options = {
                  size = mkOption {
                    type = types.int;
                    default = 90;
                    description = "Size of track thumbails";
                  };

                  squared = mkEnableOption "Whether to force square track thumbnails";
                };
              };
            };

            swipeActions = mkOption {
              type = types.submodule {
                options =
                  let
                    actions = [
                      "playafter"
                      "openinfo"
                      "none"
                      "playnext"
                      "playlast"
                      "playafter"
                      "addtoplaylist"
                      "openinfo"
                      "openArtwork"
                      "editArtwork"
                      "saveArtwork"
                      "editTags"
                      "setRating"
                      "openListens"
                      "goToAlbum"
                      "goToArtist"
                      "goToFolder"
                      "copyTitle"
                      "copyArtist"
                      "copyArtistAndTitle"
                      "copyYTLink"
                      "searchYTSimilar"
                      "delete"
                    ];
                  in
                  {
                    left = mkOption {
                      type = types.enum actions;
                      default = "playafter";
                    };

                    right = mkOption {
                      type = types.enum actions;
                      default = "openinfo";
                    };
                  };
              };

              description = "Define actions when swiping tracks";
            };
          };
        };
      };
    };
  };
}
