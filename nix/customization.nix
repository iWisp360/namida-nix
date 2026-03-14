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
      time12h = mkEnableOption "Whether to display time in 12h format";
      dateTimeFormat = mkOption {
        type = types.str;
        description = "Format for displaying date and time";
      };

      borderRadius = mkOption {
        type = types.float;
        description = "Multiplier for borders radius";
      };

      fontScale = mkOption {
        type = types.float;
        description = "Define font size";
      };

      albumTile = mkOption {
        type = types.submodule {
          options = {
            displayTrackNumber = mkEnableOption "Whether to display a small box containing the track number in the album page";
            topRightDate = mkEnableOption "Whether to display album date at Album Card's top right";
            staggeredGridview = mkEnableOption "Whether to add spacing to thumbnail for uniform arrangement";
            height = mkOption {
              type = types.int;
              description = "Height for all album tiles";
            };

            thumbnails = mkOption {
              type = types.submodule {
                options = {
                  size = mkOption {
                    type = types.int;
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
              description = "Height for all track tiles";
            };

            thumbnails = mkOption {
              type = types.submodule {
                options = {
                  size = mkOption {
                    type = types.int;
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
                      "openinfo"
                      "none"
                      "playnext"
                      "playlast"
                      "playafter"
                      "addtoplaylist"
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
                    };

                    right = mkOption {
                      type = types.enum actions;
                    };
                  };
              };

              description = "Define actions when swiping tracks";
            };
          };
        };
      };

      thirdRow = mkEnableOption "Whether to display third row";
      thirdItemEachRow = mkEnableOption "Whether to display a third item in each row";
      favoriteButton = mkEnableOption "Whether to display favorite button";
      itemsSeparator = mkOption {
        type = types.str;
        default = "•";
        description = "String that separates elements of a track";
      };

      miniPlayer = mkOption {
        type = types.submodule {
          options = {
            layout =
              let
                availableElements = [
                  "none"
                  "title"
                  "album"
                  "artists"
                  "albumArtist"
                  "genres"
                  "composer"
                  "trackNumber"
                  "discNumber"
                  "duration"
                  "year"
                  "size"
                  "dateAdded"
                  "dateModified"
                  "dateModifiedDate"
                  "dateModifiedClock"
                  "path"
                  "folder"
                  "fileName"
                  "fileNameWOExt"
                  "extension"
                  "comment"
                  "bitrate"
                  "sampleRate"
                  "format"
                  "channels"
                  "rating"
                  "tags"
                  "moods"
                  "listenCount"
                  "latestListenDate"
                  "firstListenDate"
                ];
              in
              mkOption {
                type = types.submodule {
                  options = {
                    row1 = mkOption {
                      type = types.submodule {
                        options = {
                          element1.type = types.enum availableElements;
                          element2.type = types.enum availableElements;
                          element3.type = types.enum availableElements;
                        };
                      };
                    };

                    row2 = mkOption {
                      type = types.submodule {
                        options = {
                          element1.type = types.enum availableElements;
                          element2.type = types.enum availableElements;
                          element3.type = types.enum availableElements;
                        };
                      };
                    };

                    row3 = mkOption {
                      type = types.submodule {
                        options = {
                          element1.type = types.enum availableElements;
                          element2.type = types.enum availableElements;
                          element3.type = types.enum availableElements;
                        };
                      };
                    };

                    rightItem1 = mkOption {
                      type = types.enum availableElements;
                    };

                    rightItem2 = mkOption {
                      type = types.enum availableElements;
                    };
                  };
                };
              };

            customization = mkOption {
              type = types.submodule {
                options = {
                  party = mkEnableOption "Whether to enable party effect";
                  edgeColorsSwitching = mkEnableOption "Whether to switch colors in party effect";
                  movingParticles = mkEnableOption "Whether to enable moving particles effect";
                  thumbnailAnimations = mkOption {
                    type = types.submodule {
                      options = {
                        intensity = mkOption {
                          type = types.submodule {
                            options = {
                              expandedMiniPlayer = mkOption {
                                type = types.ints.between 0 100;
                                description = "Intensity of thumbnails animations, described in a percentage divisible by 4";
                              };

                              lyrics = mkOption {
                                type = types.ints.between 0 100;
                                description = "Intensity of thumbnails animations, described in a percentage divisible by 4";
                              };

                              minimizedMiniPlayer = mkOption {
                                type = types.ints.between 0 100;
                                description = "Intensity of thumbnails animations, described in a percentage divisible by 4";
                              };
                            };
                          };
                        };

                        invert = mkEnableOption "Whether to invert animations";
                      };
                    };
                  };

                  artworkGestures = mkOption {
                    type = types.submodule {
                      options = {
                        scaleMultiplier = mkOption {
                          type = types.float;
                          description = "Multiplier for artwork gestures";
                        };

                        dt2ToggleLyrics = mkEnableOption "Whether to open lyrics by double clicking the track's artwork";
                        actions =
                          let
                            availableActions = [
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
                          mkOption {
                            type = types.submodule {
                              options = {
                                click = mkOption {
                                  type = types.enum availableActions;
                                };

                                longPress = mkOption {
                                  type = types.enum availableActions;
                                };
                              };
                            };
                          };
                      };
                    };
                  };

                  waveformBarsCount = mkOption {
                    type = types.ints.between 40 400;
                    description = "Amount of bars for the waveform of the track";
                  };

                  displayAudioInfo = mkEnableOption "Whether to display audio info in player";
                  artistBeforeTitle = mkEnableOption "Whether to display artist before title";
                };
              };
            };
          };
        };
      };
    };
  };
}
