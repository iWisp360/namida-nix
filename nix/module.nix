{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.namida;
in
{
  options.programs.namida = with lib; {
    enable = mkEnableOption "Whether to enable namida";
    package = mkOption {
      type = types.package;
      default = pkgs.callPackage ./default.nix { };
      description = "Namida package to use";
    };

    settings = mkOption {
      default = {
        enable = false;
        # ... TODO
      };

      type = types.submodule {
        config.assertions = with cfg.settings; [
          {
            assertion =
              (!appearance.autoColor && appearance.forceMiniPlayerFollowTrackColors)
              || (appearance.autoColor && !appearance.forceMiniPlayerFollowTrackColors);

            message = "autoColor and forceMiniPlayerFollowTrackColors must not be enabled at the same time";
          }
          {
            assertion = indexer.minimumTrackDuration <= 180 || indexer.minimumTrackDuration >= 0;
            message = "minimumTrackDuration must be an integer value between 0 and 180";
          }
          {
            assertion = indexer.minimumTrackDuration <= 10485760 || indexer.minimumTrackDuration >= 0;
            message = "minimumFileSize must be an integer value between 0 and 10485760";
          }
        ];

        options = {
          enable = mkEnableOption "Whether to configure Namida through home manager";
          appearance = mkOption {
            type = types.submodule {
              options = {
                blur = mkEnableOption "Whether to enable blur";
                mode = mkOption {
                  type = types.strMatching "(dark|light|system)";
                };

                forceMiniPlayerFollowTrackColors = mkEnableOption "Whether miniplayer should take track's artwork colors";
                pitchBlack = mkEnableOption "Whether to set pitch black background";
                autoColor = mkEnableOption "Whether to automatically pick player colors from music's artwork";
                animatedTheme = mkEnableOption "Whether to animate theme";
                staticColors = mkOption {
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
          };

          indexer = mkOption {
            type = types.submodule {
              options = {
                featuredArtistsFromTitle = mkEnableOption "Whether to extract (feat. X) and (ft. X) artists";
                respectNoMedia = mkEnableOption "Whether to exclude folders where .nomedia is found";
                preventDuplicates = mkEnableOption "Whether to use filename to remove duplicates of a same track";
                indexVideos = mkEnableOption "Whether to index videos";
                minimumFileSize = mkOption {
                  type = types.int;
                  description = "Define minimum file size for tracks to be indexed, in bytes";
                  default = 102400;
                };

                minimumTrackDuration = mkOption {
                  type = types.int;
                  description = "Define minimum track duration for tracks to be indexed, in seconds";
                  default = 25;
                };

                refreshOnStartup = mkEnableOption "Whether to refresh index on startup";
                artworkCache = mkOption {
                  type = types.submodule {
                    options = {
                      enable = mkEnableOption "Whether to cache artworks";
                      groupArtworksByAlbum = mkEnableOption "Whether to group artworks from different tracks in albums";
                      artworkHash = mkEnableOption "Whether to hash artworks";
                    };
                  };
                };

                genresSeparators = mkOption {
                  type = types.listOf types.str;
                  default = [
                    "&"
                    ","
                    ";"
                    "//"
                    "x"
                  ];

                  description = "Strings that separate genres in metadata";
                };

                artistsSeparators = mkOption {
                  type = types.listOf types.str;
                  default = [
                    "&"
                    ","
                    ";"
                    "//"
                    "ft."
                    "x"
                  ];

                  description = "Strings that separate artists in metadata";
                };

                albumIdentifiers = mkOption {
                  type = types.listOf types.strMatching "(albumName|year|albumArtist)";
                  default = [ ];
                  description = "Elements to identify albums";
                };

                folders = mkOption {
                  type = types.submodule {
                    options = {
                      include = mkOption {
                        type = types.listOf types.str;
                        default = [
                          "${config.home.homeDirectory}/Music"
                          "${config.home.homeDirectory}/Namida"
                        ];

                        description = "Paths that will be indexed by namida";
                      };

                      exclude = mkOption {
                        type = types.listOf types.str;
                        default = [ ];
                        description = "Paths that will not be indexed by namida";
                      };
                    };
                  };
                };
              };
            };
          };

          language = mkOption {
            default = "en_US";
            type = types.enum [
              "af"
              "bn"
              "bs"
              "es"
              "es_CO"
              "en_US"
              "nl_NL"
              "eo"
              "fi"
              "fr_FR"
              "de_DE"
              "hi_IN"
              "id_ID"
              "it_IT"
              "ja_JP"
              "ko"
              "fa_IR"
              "pl_PL"
              "pt_BR"
              "ro"
              "ru_RU"
              "sr_RS"
              "sl"
              "ta"
              "tr_TR"
              "uk_UA"
              "ur_PK"
              "vi_VN"
              "zh_tw"
              "zh_cn"
            ];

            description = "Language used by Namida";
          };
        };
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ cfg.package ];
      file.".namida/namida_settings.json" = lib.mkIf cfg.settings.enable {
        text =
          with cfg.settings;
          builtins.toJSON {
            ## Unavailable values on linux ##
            canAskForBatteryOptimizations = false;
            useMediaStore = false;
            #################################
            inherit language;
            themeMode = appearance.mode;
            inherit (appearance) pitchblack;
            inherit (appearance) autoColor;
            # staticColor = appearance.staticColors.light;    TODO
            # staticColorDark = appearance.staticColors.dark; TODO
            # static colors use a strange format and the hash needs to be converted to it
            inherit (appearance) animatedTheme;
            enableBlurEffect = appearance.blur;
            inherit (indexer) respectNoMedia;
            includeVideos = indexer.indexVideos;
            indexMinFileSizeInB = indexer.minimumFileSize;
            indexMinDurationInSec = indexer.minimumTrackDuration;
            inherit (indexer) albumIdentifiers;
            trackArtistsSeparators = indexer.artistsSeparators;
            trackGenresSeparators = indexer.genresSeparators;
            inherit (indexer) refreshOnStartup;
            cacheArtworks = indexer.artworkCache.enable;
            uniqueArtworkHash = indexer.artworkCache.artworkHash;
            inherit (indexer.artworkCache) groupArtworksByAlbum;
            directoriesToScan = indexer.folders.include;
            directoriesToExclude = indexer.folders.exclude;
            preventDuplicatedTracks = indexer.preventDuplicates;
            extractFeatArtistFromTitle = indexer.featuredArtistsFromTitle;
            # libraryTabs = ;
            # homePageItems = ;
            # activeArtistType = ;
            # activeSearchMediaTypes = ;
            # borderRadiusMultiplier = ;
            # fontScaleFactor = ;
            # artworkCacheHeightMultiplier = ;
            # trackThumbnailSizeinList = ;
            # trackListTileHeight = ;
            # albumThumbnailSizeinList = ;
            # albumListTileHeight = ;
            # displayTrackNumberinAlbumPage = ;
            # albumCardTopRightDate = ;
            # forceSquaredTrackThumbnail = ;
            # forceSquaredAlbumThumbnail = ;
            # useAlbumStaggeredGridView = ;
            # useSettingCollapsedTiles = ;
            # mediaGridCounts = ;
            # activeAlbumTypes = ;
            # activeTrSearch = ;
            # enableGlowEffect = ;
            # enableGlowBehindVideo = ;
            # hourFormat12 = ;
            # dateTimeFormat = ;
            # trackArtistsSeparatorsBlacklist = ;
            # trackGenresSeparatorsBlacklist = ;
            # extensionsBlacklist = ;
            # fileBrowserSort = ;
            # fileBrowserSortReversed = ;
            # tracksSortSearch = ;
            # tracksSortSearchReversed = ;
            # tracksSortSearchIsAuto = ;
            # albumSort = ;
            # albumSortReversed = ;
            # artistSort = ;
            # artistSortReversed = ;
            # genreSort = ;
            # genreSortReversed = ;
            # playlistSort = ;
            # playlistSortReversed = ;
            # ytPlaylistSort = ;
            # ytPlaylistSortReversed = ;
            # trackSearchFilter = ;
            # ignoreCommonPrefixForTypes = ;
            # commonPrefixes = ;
            # playlistSearchFilter = ;
            # defaultBackupLocation_v2 = ;
            # autoBackupIntervalDays = ;
            # defaultFolderStartupLocation = ;
            # defaultFolderStartupLocationVideos = ;
            # enableFoldersHierarchy = ;
            # enableFoldersHierarchyTracks = ;
            # enableFoldersHierarchyVideos = ;
            # displayArtistBeforeTitle = ;
            # heatmapListensView = ;
            # reverseListensView = ;
            # backupItemslist_v2 = ;
            # enableVideoPlayback = ;
            # enableLyrics = ;
            # lyricsSource = ;
            # videoPlaybackSource = ;
            # youtubeVideoQualities = ;
            # animatingThumbnailScaleMultiplier = ;
            # animatingThumbnailIntensity = ;
            # animatingThumbnailIntensityLyrics = ;
            # animatingThumbnailIntensityMinimized = ;
            # animatingThumbnailInversed = ;
            # enablePartyModeInMiniplayer = ;
            # enablePartyModeColorSwap = ;
            # enableMiniplayerParticles = ;
            # enableMiniplayerParallaxEffect = ;
            # forceMiniplayerTrackColor = ;
            # isTrackPlayedSecondsCount = ;
            # isTrackPlayedPercentageCount = ;
            # waveformTotalBars = ;
            # videosMaxCacheInMB = ;
            # audiosMaxCacheInMB = ;
            # imagesMaxCacheInMB = ;
            # hideStatusBarInExpandedMiniplayer = ;
            # displayFavouriteButtonInNotification = ;
            # displayStopButtonInNotification = ;
            # enableSearchCleanup = ;
            # enableBottomNavBar = ;
            # displayAudioInfoMiniplayer = ;
            # showUnknownFieldsInTrackInfoDialog = ;
            # enableM3USync = ;
            # enableM3USyncStartup = ;
            # prioritizeEmbeddedLyrics = ;
            # swipeableDrawer = ;
            # dismissibleMiniplayer = ;
            # enableClipboardMonitoring = ;
            # artworkGestureDoubleTapLRC = ;
            # previousButtonReplays = ;
            # alwaysExpandedSearchbar = ;
            # mixedQueue = ;
            # bypassRefreshPrompt = ;
            # desktopTitlebar = ;
            # desktopTitlebarType = ;
            # tagFieldsToEdit = ;
            # stretchLyricsDuration = ;
            # playlistAddTracksAtBeginning = ;
            # playlistAddTracksAtBeginningYT = ;
            # wakelockMode = ;
            # localVideoMatchingType = ;
            # localVideoMatchingCheckSameDir = ;
            # trackPlayMode = ;
            # onNotificationTapAction = ;
            # performanceMode = ;
            # floatingActionButton = ;
            # vibrationType = ;
            # mostPlayedTimeRange = ;
            # mostPlayedCustomDateRange = ;
            # mostPlayedCustomisStartOfDay = ;
            # ytMostPlayedTimeRange = ;
            # ytMostPlayedCustomDateRange = ;
            # ytMostPlayedCustomisStartOfDay = ;
            # onTrackSwipeLeft = ;
            # onTrackSwipeRight = ;
            # artworkTapAction = ;
            # artworkLongPressAction = ;
            # displayThirdRow = ;
            # displayThirdItemInEachRow = ;
            # trackTileSeparator = ;
            # displayFavouriteIconInListTile = ;
            # gradientTiles = ;
            # editTagsKeepFileDates = ;
            # downloadFilesWriteUploadDate = ;
            # downloadFilesKeepCachedVersions = ;
            # downloadAddAudioToLocalLibrary = ;
            # downloadAudioOnly = ;
            # downloadOverrideOldFiles = ;
            # enablePip = ;
            # pickColorsFromDeviceWallpaper = ;
            # trackItem = ;
            # queueInsertion = ;
            # mediaItemsTrackSorting = ;
            # mediaItemsTrackSortingReverse = ;
            # imageSourceAlbum = ;
            # imageSourceArtist = ;
            # fontScaleLRC = ;
            # fontScaleLRCFull = ;
          };
      };
    };
  };
}
