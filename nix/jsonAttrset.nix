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
  hideStatusBarInExpandedMiniplayer = false;
  displayFavouriteButtonInNotification = false;
  #################################
  # appearance related options
  themeMode = appearance.mode;
  inherit (appearance) pitchBlack;
  inherit (appearance) autoColor;
  staticColor = hexToInt32Argb (lib.toLower appearance.staticColors.light);
  staticColorDark = hexToInt32Argb (lib.toLower appearance.staticColors.dark);
  inherit (appearance) animatedTheme;

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
  enableBlurEffect = customization.blur;
  enableGlowEffect = customization.glow;
  enableMiniplayerParallaxEffect = customization.parallax;
  borderRadiusMultiplier = customization.borderRadius;
  fontScaleFactor = customization.fontScale;
  hourFormat12 = customization.time12h;
  inherit (customization) dateTimeFormat;
  displayTrackNumberinAlbumPage = customization.albumTile.displayTrackNumber;
  albumCardTopRightDate = customization.albumTile.topRightDate;
  forceSquaredAlbumThumbnail = customization.albumTile.thumbnails.squared;
  useAlbumStaggeredGridView = customization.albumTile.staggeredGridView;
  albumThumbnailSizeinList = customization.albumTile.thumbnails.size + 0.0;
  albumListTileHeight = customization.albumTile.height + 0.0;
  forceSquaredTrackThumbnail = customization.trackTile.thumbnails.squared;
  trackThumbnailSizeinList = customization.trackTile.thumbnails.size + 0.0;
  trackListTileHeight = customization.trackTile.height + 0.0;
  onTrackSwipeLeft = customization.trackTile.swipeActions.left;
  onTrackSwipeRight = customization.trackTile.swipeActions.right;
  displayThirdRow = customization.thirdRow;
  displayThirdItemInEachRow = customization.thirdItemEachRow;
  trackTileSeparator = customization.itemsSeparator;
  displayFavouriteIconInListTile = customization.favoriteButton;
  trackItem = {
    row1Item1 = customization.miniPlayer.layout.row1.element1;
    row1Item2 = customization.miniPlayer.layout.row1.element2;
    row1Item3 = customization.miniPlayer.layout.row1.element3;

    row2Item1 = customization.miniPlayer.layout.row2.element1;
    row2Item2 = customization.miniPlayer.layout.row2.element2;
    row2Item3 = customization.miniPlayer.layout.row2.element3;

    row3Item1 = customization.miniPlayer.layout.row3.element1;
    row3Item2 = customization.miniPlayer.layout.row3.element2;
    row3Item3 = customization.miniPlayer.layout.row3.element3;

    inherit (customization.miniPlayer.layout) rightItem1;
    inherit (customization.miniPlayer.layout) rightItem2;
  };

  enablePartyModeInMiniplayer = customization.miniPlayer.customization.party;
  enablePartyModeColorSwap = customization.miniPlayer.customization.edgeColorsSwitching;
  enableMiniplayerParticles = customization.miniPlayer.customization.movingParticles;

  animatingThumbnailScaleMultiplier =
    customization.miniPlayer.customization.artworkGestures.scaleMultiplier;

  animatingThumbnailIntensity =
    customization.miniPlayer.customization.thumbnailAnimations.intensity.expandedMiniPlayer / 4;

  animatingThumbnailIntensityLyrics =
    customization.miniPlayer.customization.thumbnailAnimations.intensity.lyrics / 4;

  animatingThumbnailIntensityMinimized =
    customization.miniPlayer.customization.thumbnailAnimations.intensity.minimizedMiniPlayer / 4;

  artworkGestureDoubleTapLRC = customization.miniPlayer.customization.artworkGestures.dt2ToggleLyrics;
  artworkTapAction = customization.miniPlayer.customization.artworkGestures.actions.click;
  artworkLongPressAction = customization.miniPlayer.customization.artworkGestures.actions.longPress;
  waveformTotalBars = customization.miniPlayer.customization.waveformBarsCount;
  displayAudioInfoMiniplayer = customization.miniPlayer.customization.displayAudioInfo;
  displayArtistBeforeTitle = customization.miniPlayer.customization.artistBeforeTitle;

  # playback related options TODO

  # YT related option TODO

  # backup related options TODO

  # misc options TODO covers extras and advanced sections
  language.code = language;
  # libraryTabs = ;
  # homePageItems = ;
  # activeArtistType = ;
  # activeSearchMediaTypes = ;
  # artworkCacheHeightMultiplier = ;
  # albumListTileHeight = ;
  # displayTrackNumberinAlbumPage = ;
  # albumCardTopRightDate = ;
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
  # heatmapListensView = ;
  # reverseListensView = ;
  # backupItemslist_v2 = ;
  # enableVideoPlayback = ;
  # enableLyrics = ;
  # lyricsSource = ;
  # videoPlaybackSource = ;
  # youtubeVideoQualities = ;
  # animatingThumbnailInversed = ;
  # enableMiniplayerParallaxEffect = ;
  # isTrackPlayedSecondsCount = ;
  # isTrackPlayedPercentageCount = ;
  # videosMaxCacheInMB = ;
  # audiosMaxCacheInMB = ;
  # imagesMaxCacheInMB = ;
  # hideStatusBarInExpandedMiniplayer = ;
  # displayFavouriteButtonInNotification = ;
  # displayStopButtonInNotification = ;
  # enableSearchCleanup = ;
  # enableBottomNavBar = ;
  # showUnknownFieldsInTrackInfoDialog = ;
  # enableM3USync = ;
  # enableM3USyncStartup = ;
  # prioritizeEmbeddedLyrics = ;
  # swipeableDrawer = ;
  # dismissibleMiniplayer = ;
  # enableClipboardMonitoring = ;
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
