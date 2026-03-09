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
  options.programs.namida = {
    enable = lib.mkEnableOption "Whether to enable namida";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.callPackage ./default.nix { };
      description = "Namida package to use";
    };

    settings = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "Whether to configure Namida through home manager";
          data = lib.mkOption {
            type = lib.types.attrs;
            description = "Namida configuration";
            default =
              let
                homeDir = config.home.homeDirectory;
              in
              rec {
                directoriesToScan = [
                  {
                    source = "${homeDir}/Music";
                  }
                  {
                    source = "${homeDir}/Namida";
                  }
                ];

                defaultFolderStartupLocation = config.home.homeDirectory;
                defaultFolderStartupLocationVideos = defaultFolderStartupLocation;

                activeAlbumTypes = {
                  normal = true;
                  single = true;
                };

                activeArtistType = "artist";
                activeSearchMediaTypes = [
                  "track"
                  "album"
                  "artist"
                ];

                albumCardTopRightDate = true;
                albumIdentifiers = [ "albumName" ];
                albumListTileHeight = 90;
                albumSort = "album";
                albumSortReversed = false;
                albumThumbnailSizeinList = 90;
                alwaysExpandedSearchbar = false;
                animatedTheme = true;
                animatingThumbnailIntensity = 25;
                animatingThumbnailIntensityLyrics = 10;
                animatingThumbnailIntensityMinimized = 10;
                animatingThumbnailInversed = false;
                animatingThumbnailScaleMultiplier = 1;
                artistSort = "artistsList";
                artistSortReversed = false;
                artworkCacheHeightMultiplier = 0.9;
                artworkGestureDoubleTapLRC = true;
                artworkLongPressAction = "none";
                artworkTapAction = "none";
                audiosMaxCacheInMB = 4096;
                autoBackupIntervalDays = 2;
                autoColor = true;
                backupItemslist_v2 = null;
                borderRadiusMultiplier = 1;
                cacheArtworks = true;
                canAskForBatteryOptimizations = true;
                commonPrefixes = [
                  "the "
                  "a "
                  "an "
                ];

                dateTimeFormat = "MMM yyyy";
                defaultBackupLocation_v2 = null;
                desktopTitlebar = true;
                desktopTitlebarType = "auto";
                directoriesToExclude = [ ];
                dismissibleMiniplayer = true;
                displayArtistBeforeTitle = true;
                displayAudioInfoMiniplayer = false;
                displayFavouriteButtonInNotification = false;
                displayFavouriteIconInListTile = true;
                displayStopButtonInNotification = true;
                displayThirdItemInEachRow = false;
                displayThirdRow = true;
                displayTrackNumberinAlbumPage = true;
                downloadAddAudioToLocalLibrary = true;
                downloadAudioOnly = false;
                downloadFilesKeepCachedVersions = true;
                downloadFilesWriteUploadDate = false;
                downloadOverrideOldFiles = false;
                editTagsKeepFileDates = true;
                enableBlurEffect = false;
                enableBottomNavBar = true;
                enableClipboardMonitoring = false;
                enableFoldersHierarchy = true;
                enableFoldersHierarchyVideos = true;
                enableGlowBehindVideo = false;
                enableGlowEffect = false;
                enableLyrics = false;
                enableM3USync = false;
                enableM3USyncStartup = true;
                enableMiniplayerParallaxEffect = true;
                enableMiniplayerParticles = true;
                enablePartyModeColorSwap = true;
                enablePartyModeInMiniplayer = false;
                enablePip = true;
                enableSearchCleanup = true;
                enableVideoPlayback = true;
                extractFeatArtistFromTitle = true;
                fileBrowserSort = "name";
                fileBrowserSortReversed = false;
                floatingActionButton = "none";
                forceMiniplayerTrackColor = false;
                forceSquaredAlbumThumbnail = false;
                forceSquaredTrackThumbnail = false;
                genreSort = "genresList";
                genreSortReversed = false;
                gradientTiles = true;
                groupArtworksByAlbum = false;
                heatmapListensView = false;
                hideStatusBarInExpandedMiniplayer = false;
                homePageItems = [
                  "mixes"
                  "recentListens"
                  "topRecentListens"
                  "lostMemories"
                  "recentlyAdded"
                  "recentAlbums"
                  "recentArtists"
                ];

                hourFormat12 = true;
                ignoreCommonPrefixForTypes = [ ];
                imageSourceAlbum = [
                  "lastfm"
                  "local"
                ];

                imageSourceArtist = [
                  "lastfm"
                  "local"
                ];

                imagesMaxCacheInMB = 256;
                includeVideos = true;
                indexMinDurationInSec = 5;
                indexMinFileSizeInB = 102400;
                isTrackPlayedPercentageCount = 40;
                isTrackPlayedSecondsCount = 40;
                libraryTabs = [
                  "home"
                  "tracks"
                  "artists"
                  "playlists"
                  "folders"
                  "youtube"
                ];

                localVideoMatchingCheckSameDir = false;
                localVideoMatchingType = "auto";
                lyricsSource = "auto";
                mediaGridCounts = {
                  albums = null;
                  artists = null;
                  genres = null;
                  playlists = 1;
                };

                mediaItemsTrackSorting = {
                  album = [
                    "discNo"
                    "trackNo"
                    "year"
                    "title"
                  ];

                  albumArtist = [
                    "year"
                    "title"
                  ];

                  artist = [
                    "year"
                    "title"
                  ];

                  composer = [
                    "year"
                    "title"
                  ];

                  folder = [ "filename" ];
                  folderMusic = [ "filename" ];
                  folderVideo = [ "filename" ];
                  genre = [
                    "year"
                    "title"
                  ];

                  track = [
                    "title"
                    "year"
                    "album"
                  ];
                };
                mediaItemsTrackSortingReverse = {
                  album = false;
                  artist = false;
                  folder = false;
                  folderMusic = false;
                  folderVideo = false;
                  genre = false;
                  track = false;
                };

                mixedQueue = false;
                mostPlayedCustomDateRange = {
                  newest = -62167201200000000;
                  oldest = -62167201200000000;
                };

                mostPlayedCustomisStartOfDay = true;
                mostPlayedTimeRange = "allTime";
                onNotificationTapAction = "openApp";
                onTrackSwipeLeft = "playafter";
                onTrackSwipeRight = "openinfo";
                performanceMode = "balanced";
                pickColorsFromDeviceWallpaper = false;
                pitchBlack = false;
                playlistAddTracksAtBeginning = false;
                playlistAddTracksAtBeginningYT = false;
                playlistSearchFilter = [
                  "name"
                  "creationDate"
                  "modifiedDate"
                  "moods"
                  "comment"
                ];

                playlistSort = "dateModified";
                playlistSortReversed = false;
                preventDuplicatedTracks = false;
                previousButtonReplays = false;
                prioritizeEmbeddedLyrics = true;
                queueInsertion = {
                  algorithm = {
                    insertNext = true;
                    numberOfTracks = 20;
                    sortBy = "none";
                  };

                  algorithmDiscoverDate = {
                    insertNext = true;
                    numberOfTracks = 20;
                    sortBy = "listenCount";
                  };

                  algorithmTimeRange = {
                    insertNext = true;
                    numberOfTracks = 20;
                    sortBy = "none";
                  };

                  listenTimeRange = {
                    insertNext = true;
                    numberOfTracks = 0;
                    sortBy = "none";
                  };

                  mix = {
                    insertNext = true;
                    numberOfTracks = 0;
                    sortBy = "none";
                  };

                  mood = {
                    insertNext = true;
                    numberOfTracks = 20;
                    sortBy = "listenCount";
                  };

                  moreAlbum = {
                    insertNext = false;
                    numberOfTracks = 10;
                    sortBy = "random";
                  };

                  moreArtist = {
                    insertNext = false;
                    numberOfTracks = 10;
                    sortBy = "random";
                  };

                  moreFolder = {
                    insertNext = false;
                    numberOfTracks = 10;
                    sortBy = "random";
                  };

                  random = {
                    insertNext = false;
                    numberOfTracks = 10;
                    sortBy = "none";
                  };

                  rating = {
                    insertNext = false;
                    numberOfTracks = 20;
                    sortBy = "rating";
                  };

                  sameReleaseDate = {
                    insertNext = true;
                    numberOfTracks = 30;
                    sortBy = "listenCount";
                  };
                };

                refreshOnStartup = false;
                respectNoMedia = false;
                reverseListensView = true;
                selectedLanguage = {
                  code = "en_US";
                  country = "United States";
                  name = "English";
                };

                showUnknownFieldsInTrackInfoDialog = true;
                staticColor = 4288453057;
                staticColorDark = 4283321458;
                stretchLyricsDuration = true;
                swipeableDrawer = true;
                tagFieldsToEdit = [
                  "trackNumber"
                  "year"
                  "title"
                  "artist"
                  "album"
                  "genre"
                  "albumArtist"
                  "composer"
                  "comment"
                  "description"
                  "lyrics"
                ];

                themeMode = "system";
                trackArtistsSeparators = [
                  "&"
                  ","
                  ";"
                  "//"
                  " ft. "
                  " x "
                ];

                trackArtistsSeparatorsBlacklist = [ ];
                trackGenresSeparators = [
                  "&"
                  ","
                  ";"
                  "//"
                  " x "
                ];

                trackGenresSeparatorsBlacklist = [ ];
                trackItem = {
                  rightItem1 = "duration";
                  rightItem2 = "none";
                  row1Item1 = "title";
                  row1Item2 = "none";
                  row1Item3 = "none";
                  row2Item1 = "artists";
                  row2Item2 = "none";
                  row2Item3 = "none";
                  row3Item1 = "album";
                  row3Item2 = "year";
                  row3Item3 = "none";
                };

                trackListTileHeight = 70;
                trackPlayMode = "searchResults";
                trackSearchFilter = [
                  "filename"
                  "title"
                  "artist"
                  "album"
                ];

                trackThumbnailSizeinList = 70;
                trackTileSeparator = "•";
                tracksSortSearch = "title";
                tracksSortSearchIsAuto = true;
                tracksSortSearchReversed = false;
                uniqueArtworkHash = false;
                useAlbumStaggeredGridView = false;
                useMediaStore = false;
                useSettingCollapsedTiles = true;
                vibrationType = "vibration";
                videoPlaybackSource = "auto";
                videosMaxCacheInMB = 8192;
                wakelockMode = "expandedAndVideo";
                waveformTotalBars = 80;
                youtubeVideoQualities = [
                  "480p"
                  "360p"
                  "240p"
                  "144p"
                ];

                ytMostPlayedCustomisStartOfDay = true;
                ytMostPlayedTimeRange = "allTime";
                ytPlaylistSort = "dateModified";
                ytPlaylistSortReversed = true;
              };
          };
        };
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ cfg.package ];
      file.".namida/namida_settings.json" = lib.mkIf cfg.settings.enable {
        text = builtins.toJSON cfg.settings.data;
      };
    };
  };
}
