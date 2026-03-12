{
  appearance,
  lib,
  hexToInt32Argb,
  customization,
  indexer,
  language,
}:
{
  ## Unavailable values on linux ##
  canAskForBatteryOptimizations = false;
  useMediaStore = false;
  enablePip = false;
  pickColorsFromDeviceWallpaper = false;
  #################################
  # appearance related options
  themeMode = appearance.mode;
  inherit (appearance) pitchBlack;
  inherit (appearance) autoColor;
  staticColor = hexToInt32Argb (lib.toLower appearance.staticColors.light);
  staticColorDark = hexToInt32Argb (lib.toLower appearance.staticColors.dark);
  inherit (appearance) animatedTheme;
  enableBlurEffect = customization.blur;

  # indexer related options
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
  forceMiniplayerTrackColor = appearance.forceMiniPlayerFollowTrackColors;

  # customization related options
  # animatingThumbnailScaleMultiplier = ;
  # animatingThumbnailIntensity =  / 4;
  # animatingThumbnailIntensityLyrics = / 4;
  # animatingThumbnailIntensityMinimized = / 4;

  # misc options
  language.code = language;
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
  # animatingThumbnailInversed = ;
  # enablePartyModeInMiniplayer = ;
  # enablePartyModeColorSwap = ;
  # enableMiniplayerParticles = ;
  # enableMiniplayerParallaxEffect = ;
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
  # trackItem = ;
  # queueInsertion = ;
  # mediaItemsTrackSorting = ;
  # mediaItemsTrackSortingReverse = ;
  # imageSourceAlbum = ;
  # imageSourceArtist = ;
  # fontScaleLRC = ;
  # fontScaleLRCFull = ;
}
