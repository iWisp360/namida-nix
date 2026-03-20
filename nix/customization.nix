{
  types,
  mkOption,
}:
mkOption {
  default = { };
  type = types.submodule {
    options = {
      floatingActionButton = mkOption {
        type = types.enum [
          "none"
          "play"
          "shuffle"
          "search"
        ];

        default = "none";
        description = "Floating Action Button in player";
      };

      navigationBar =
        let
          tabs = [
            "home"
            "albums"
            "tracks"
            "artists"
            "genres"
            "playlists"
            "folders"
            "foldersMusic"
            "foldersVideos"
            "search"
            "youtube"
          ];
        in
        mkOption {
          description = "Settings for the bottombar or sidebar";
          default = { };
          type = types.submodule {
            options = {
              defaultTab = mkOption {
                type = types.enum tabs ++ [ "auto" ];
                default = "auto";
              };

              disposition = mkOption {
                type = types.listOf types.enum tabs;

                default = [
                  "home"
                  "tracks"
                  "artists"
                  "playlists"
                  "folders"
                  "youtube"
                ];
              };
            };
          };
        };

      blur = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to enable blur";
      };

      glow = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to enable glow";
      };

      parallax = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to enable parallax";
      };

      time12h = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to display time in 12h format";
      };

      dateTimeFormat = mkOption {
        type = types.str;
        default = "MMM yyyy";
        description = "Format for displaying date and time";
      };

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

      albumTile = mkOption {
        default = { };
        type = types.submodule {
          options = {
            displayTrackNumber = mkOption {
              type = types.bool;
              default = true;
              description = "Whether to display a small box containing the track number in the album page";
            };

            topRightDate = mkOption {
              type = types.bool;
              default = true;
              description = "Whether to display album date at Album Card's top right";
            };

            staggeredGridview = mkOption {
              type = types.bool;
              default = false;
              description = "Whether to add spacing to thumbnail for uniform arrangement";
            };

            height = mkOption {
              type = types.int;
              default = 90;
              description = "Height for all album tiles";
            };

            thumbnails = mkOption {
              default = { };
              type = types.submodule {
                options = {
                  size = mkOption {
                    type = types.int;
                    default = 90;
                    description = "Size of album thumbails";
                  };

                  squared = mkOption {
                    type = types.bool;
                    default = false;
                    description = "Whether to force square album thumbnails";
                  };
                };
              };
            };
          };
        };
      };

      trackTile = mkOption {
        default = { };
        type = types.submodule {
          options = {
            height = mkOption {
              type = types.int;
              default = 90;
              description = "Height for all track tiles";
            };

            thumbnails = mkOption {
              default = { };
              type = types.submodule {
                options = {
                  size = mkOption {
                    type = types.int;
                    default = 90;
                    description = "Size of track thumbails";
                  };

                  squared = mkOption {
                    type = types.bool;
                    default = false;
                    description = "Whether to force square track thumbnails";
                  };
                };
              };
            };

            swipeActions = mkOption {
              default = { };
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

      thirdRow = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to display third row";
      };

      thirdItemEachRow = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to display a third item in each row";
      };

      favoriteButton = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to display favorite button";
      };

      itemsSeparator = mkOption {
        type = types.str;
        default = "•";
        description = "String that separates elements of a track";
      };

      miniPlayer = mkOption {
        default = { };
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
                default = { };
                type = types.submodule {
                  options = {
                    row1 = mkOption {
                      default = { };
                      type = types.submodule {
                        options = {
                          element1 = mkOption {
                            type = types.enum availableElements;
                            default = "title";
                          };

                          element2 = mkOption {
                            type = types.enum availableElements;
                            default = "none";
                          };

                          element3 = mkOption {
                            type = types.enum availableElements;
                            default = "none";
                          };
                        };
                      };
                    };

                    row2 = mkOption {
                      default = { };
                      type = types.submodule {
                        options = {
                          element1 = mkOption {
                            type = types.enum availableElements;
                            default = "artists";
                          };

                          element2 = mkOption {
                            type = types.enum availableElements;
                            default = "none";
                          };

                          element3 = mkOption {
                            type = types.enum availableElements;
                            default = "none";
                          };
                        };
                      };
                    };

                    row3 = mkOption {
                      default = { };
                      type = types.submodule {
                        options = {
                          element1 = mkOption {
                            type = types.enum availableElements;
                            default = "album";
                          };

                          element2 = mkOption {
                            type = types.enum availableElements;
                            default = "year";
                          };

                          element3 = mkOption {
                            type = types.enum availableElements;
                            default = "none";
                          };
                        };
                      };
                    };

                    rightItem1 = mkOption {
                      type = types.enum availableElements;
                      default = "duration";
                    };

                    rightItem2 = mkOption {
                      type = types.enum availableElements;
                      default = "none";
                    };
                  };
                };
              };

            customization = mkOption {
              default = { };
              type = types.submodule {
                options = {
                  party = mkOption {
                    type = types.bool;
                    default = false;
                    description = "Whether to enable party effect";
                  };

                  edgeColorsSwitching = mkOption {
                    type = types.bool;
                    default = true;
                    description = "Whether to switch colors in party effect";
                  };

                  movingParticles = mkOption {
                    type = types.bool;
                    default = true;
                    description = "Whether to enable moving particles effect";
                  };

                  thumbnailAnimations = mkOption {
                    default = { };
                    type = types.submodule {
                      options = {
                        intensity = mkOption {
                          default = { };
                          type = types.submodule {
                            options = {
                              expandedMiniPlayer = mkOption {
                                type = types.ints.between 0 100;
                                default = 100;
                                description = "Intensity of thumbnails animations, described in a percentage divisible by 4";
                              };

                              lyrics = mkOption {
                                type = types.ints.between 0 100;
                                default = 40;
                                description = "Intensity of thumbnails animations, described in a percentage divisible by 4";
                              };

                              minimizedMiniPlayer = mkOption {
                                type = types.ints.between 0 100;
                                default = 40;
                                description = "Intensity of thumbnails animations, described in a percentage divisible by 4";
                              };
                            };
                          };
                        };

                        invert = mkOption {
                          type = types.bool;
                          default = false;
                          description = "Whether to invert animations";
                        };
                      };
                    };
                  };

                  artworkGestures = mkOption {
                    default = { };
                    type = types.submodule {
                      options = {
                        scaleMultiplier = mkOption {
                          type = types.float;
                          default = 1.0;
                          description = "Multiplier for artwork gestures";
                        };

                        dt2ToggleLyrics = mkOption {
                          type = types.bool;
                          default = true;
                          description = "Whether to open lyrics by double clicking the track's artwork";
                        };

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
                            default = { };
                            type = types.submodule {
                              options = {
                                click = mkOption {
                                  type = types.enum availableActions;
                                  default = "none";
                                };

                                longPress = mkOption {
                                  type = types.enum availableActions;
                                  default = "none";
                                };
                              };
                            };
                          };
                      };
                    };
                  };

                  waveformBarsCount = mkOption {
                    type = types.ints.between 40 400;
                    default = 80;
                    description = "Amount of bars for the waveform of the track";
                  };

                  displayAudioInfo = mkOption {
                    type = types.bool;
                    default = false;
                    description = "Whether to display audio info in player";
                  };

                  artistBeforeTitle = mkOption {
                    type = types.bool;
                    default = true;
                    description = "Whether to display artist before title";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
