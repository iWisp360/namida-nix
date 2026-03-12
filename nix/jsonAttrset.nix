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
  # playback related options TODO

  # YT related option TODO

  # backup related options TODO

  # misc options TODO covers extras and advanced sections
  language.code = language;
}
++ (with appearance; {
  themeMode = mode;
  inherit pitchBlack;
  inherit autoColor;
  staticColor = hexToInt32Argb (lib.toLower staticColors.light);
  staticColorDark = hexToInt32Argb (lib.toLower staticColors.dark);
  inherit animatedTheme;
  forceMiniplayerTrackColor = forceMiniPlayerFollowTrackColors;
})
++ (with indexer; {
  inherit respectNoMedia;
  includeVideos = indexVideos;
  indexMinFileSizeInB = minimumFileSize;
  indexMinDurationInSec = minimumTrackDuration;
  inherit albumIdentifiers;
  trackArtistsSeparators = artistsSeparators;
  trackGenresSeparators = genresSeparators;
  inherit refreshOnStartup;
  cacheArtworks = artworkCache.enable;
  uniqueArtworkHash = artworkCache.artworkHash;
  inherit (artworkCache) groupArtworksByAlbum;
  directoriesToScan = folders.include;
  directoriesToExclude = folders.exclude;
  preventDuplicatedTracks = preventDuplicates;
  extractFeatArtistFromTitle = featuredArtistsFromTitle;
})
++ (with customization; {
  enableBlurEffect = blur;
  enableGlowEffect = glow;
  enableMiniplayerParallaxEffect = parallax;
  borderRadiusMultiplier = borderRadius;
  fontScaleFactor = fontScale;
  hourFormat12 = time12h;
  inherit dateTimeFormat;
  displayTrackNumberinAlbumPage = albumTile.displayTrackNumber;
  albumCardTopRightDate = albumTile.topRightDate;
  forceSquaredAlbumThumbnail = albumTile.thumbnails.squared;
  useAlbumStaggeredGridView = albumTile.staggeredGridView;
  albumThumbnailSizeinList = albumTile.thumbnails.size + 0.0;
  albumListTileHeight = albumTile.height + 0.0;
  forceSquaredTrackThumbnail = trackTile.thumbnails.squared;
  trackThumbnailSizeinList = trackTile.thumbnails.size + 0.0;
  trackListTileHeight = trackTile.height + 0.0;
  onTrackSwipeLeft = trackTile.swipeActions.left;
  onTrackSwipeRight = trackTile.swipeActions.right;
  displayThirdRow = thirdRow;
  displayThirdItemInEachRow = thirdItemEachRow;
  trackTileSeparator = itemsSeparator;
  displayFavouriteIconInListTile = favoriteButton;
  trackItem = {
    row1Item1 = miniPlayer.layout.row1.element1;
    row1Item2 = miniPlayer.layout.row1.element2;
    row1Item3 = miniPlayer.layout.row1.element3;

    row2Item1 = miniPlayer.layout.row2.element1;
    row2Item2 = miniPlayer.layout.row2.element2;
    row2Item3 = miniPlayer.layout.row2.element3;

    row3Item1 = miniPlayer.layout.row3.element1;
    row3Item2 = miniPlayer.layout.row3.element2;
    row3Item3 = miniPlayer.layout.row3.element3;

    inherit (miniPlayer.layout) rightItem1;
    inherit (miniPlayer.layout) rightItem2;
  };

  enablePartyModeInMiniplayer = miniPlayer.customization.party;
  enablePartyModeColorSwap = miniPlayer.customization.edgeColorsSwitching;
  enableMiniplayerParticles = miniPlayer.customization.movingParticles;

  animatingThumbnailScaleMultiplier = miniPlayer.customization.artworkGestures.scaleMultiplier;

  animatingThumbnailIntensity =
    miniPlayer.customization.thumbnailAnimations.intensity.expandedMiniPlayer / 4;

  animatingThumbnailIntensityLyrics =
    miniPlayer.customization.thumbnailAnimations.intensity.lyrics / 4;

  animatingThumbnailIntensityMinimized =
    miniPlayer.customization.thumbnailAnimations.intensity.minimizedMiniPlayer / 4;

  artworkGestureDoubleTapLRC = miniPlayer.customization.artworkGestures.dt2ToggleLyrics;
  artworkTapAction = miniPlayer.customization.artworkGestures.actions.click;
  artworkLongPressAction = miniPlayer.customization.artworkGestures.actions.longPress;
  waveformTotalBars = miniPlayer.customization.waveformBarsCount;
  displayAudioInfoMiniplayer = miniPlayer.customization.displayAudioInfo;
  displayArtistBeforeTitle = miniPlayer.customization.artistBeforeTitle;
})

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
