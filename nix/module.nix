{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.namida;
  nsettings = cfg.settings;
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
      type = types.submodule {
        config.assertions = [
          {
            assertion =
              cfg.settings.appearance.autoColor
              || (
                cfg.settings.appearance.staticColors.light != null
                || cfg.settings.appearance.staticColors.dark != null
              );

            message = "staticColors must be set if autoColor is set to false";
          }
        ];

        options = {
          enable = mkEnableOption "Whether to configure Namida through home manager";
          appearance = mkOption {
            default = { };
            type = types.submodule {
              options = {
                blur = mkEnableOption "Whether to enable blur";
                mode = mkOption {
                  type = types.strMatching "(dark|light|system)";
                };

                pitchBlack = mkEnableOption "Whether to set pitch black background";
                autoColor = mkOption {
                  type = types.bool;
                  description = "Whether to automatically pick player colors from music's artwork";
                  default = true;
                };

                animatedTheme = mkEnableOption "";
                staticColors = mkOption {
                  description = "Set a color to be used by the player. Used if autoColor.enable is set to false";
                  type = types.submodule {
                    options = {
                      light = mkOption {
                        type = types.nullOr (types.strMatching "^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$");
                        default = null;
                      };

                      dark = mkOption {
                        type = types.nullOr (types.strMatching "^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$");
                        default = null;
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
      file.".namida/namida_settings.json" = lib.mkIf nsettings.enable {
        text = builtins.toJSON {
          inherit (nsettings) language;
          themeMode = nsettings.appearance.mode;
          inherit (nsettings.appearance) pitchblack;
          inherit (nsettings.appearance) autoColor;
          staticColor = nsettings.appearance.staticColors.light;
          staticColorDark = nsettings.appearance.staticColors.dark;
          inherit (nsettings.appearance) animatedTheme;
          # libraryTabs = ;
          # homePageItems = ;
          # activeArtistType = ;
          # activeSearchMediaTypes = ;
          # albumIdentifiers = ;
          # borderRadiusMultiplier = ;
          # fontScaleFactor = ;
          # artworkCacheHeightMultiplier = ;
          # trackThumbnailSizeinList = ;
          # trackListTileHeight = ;
          # albumThumbnailSizeinList = ;
          # albumListTileHeight = ;
          # useMediaStore = ;
          # includeVideos = ;
          # cacheArtworks = ;
          # displayTrackNumberinAlbumPage = ;
          # albumCardTopRightDate = ;
          # forceSquaredTrackThumbnail = ;
          # forceSquaredAlbumThumbnail = ;
          # useAlbumStaggeredGridView = ;
          # useSettingCollapsedTiles = ;
          # mediaGridCounts = ;
          # activeAlbumTypes = ;
          # activeTrSearch = ;
          # enableBlurEffect = ;
          # enableGlowEffect = ;
          # enableGlowBehindVideo = ;
          # hourFormat12 = ;
          # dateTimeFormat = ;
          # trackArtistsSeparators = ;
          # trackGenresSeparators = ;
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
          # indexMinDurationInSec = ;
          # indexMinFileSizeInB = ;
          # trackSearchFilter = ;
          # ignoreCommonPrefixForTypes = ;
          # commonPrefixes = ;
          # playlistSearchFilter = ;
          # directoriesToScan = ;
          # directoriesToExclude = ;
          # preventDuplicatedTracks = ;
          # respectNoMedia = ;
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
          # extractFeatArtistFromTitle = ;
          # groupArtworksByAlbum = ;
          # uniqueArtworkHash = ;
          # enableM3USync = ;
          # enableM3USyncStartup = ;
          # prioritizeEmbeddedLyrics = ;
          # swipeableDrawer = ;
          # dismissibleMiniplayer = ;
          # enableClipboardMonitoring = ;
          # artworkGestureDoubleTapLRC = ;
          # previousButtonReplays = ;
          # refreshOnStartup = ;
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
          # canAskForBatteryOptimizations = ;
        };
      };
    };
  };
}
