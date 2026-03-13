{
  appearance,
  lib,
  customization,
  indexer,
  language,
}:
let
  helpers = ./helpers.nix { inherit lib; };
  f = helpers.intToFloat;
in
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
// (with appearance; {
  themeMode = mode;
  inherit pitchBlack autoColor animatedTheme;
  staticColor = helpers.hexToInt32Argb (lib.toLower staticColors.light);
  staticColorDark = helpers.hexToInt32Argb (lib.toLower staticColors.dark);
  forceMiniplayerTrackColor = forceMiniPlayerFollowTrackColors;
})
// (with indexer; {
  inherit respectNoMedia albumIdentifiers refreshOnStartup;
  inherit (artworkCache) groupArtworksByAlbum;
  includeVideos = indexVideos;
  indexMinFileSizeInB = minimumFileSize;
  indexMinDurationInSec = minimumTrackDuration;
  trackArtistsSeparators = artistsSeparators;
  trackGenresSeparators = genresSeparators;
  cacheArtworks = artworkCache.enable;
  uniqueArtworkHash = artworkCache.artworkHash;
  directoriesToScan = folders.include;
  directoriesToExclude = folders.exclude;
  preventDuplicatedTracks = preventDuplicates;
  extractFeatArtistFromTitle = featuredArtistsFromTitle;
})
// (with customization; {
  inherit dateTimeFormat;
  enableBlurEffect = blur;
  enableGlowEffect = glow;
  enableMiniplayerParallaxEffect = parallax;
  borderRadiusMultiplier = borderRadius;
  fontScaleFactor = fontScale;
  hourFormat12 = time12h;
  displayTrackNumberinAlbumPage = albumTile.displayTrackNumber;
  albumCardTopRightDate = albumTile.topRightDate;
  forceSquaredAlbumThumbnail = albumTile.thumbnails.squared;
  useAlbumStaggeredGridView = albumTile.staggeredGridView;
  albumThumbnailSizeinList = f albumTile.thumbnails.size;
  albumListTileHeight = f albumTile.height;
  forceSquaredTrackThumbnail = trackTile.thumbnails.squared;
  trackThumbnailSizeinList = f trackTile.thumbnails.size;
  trackListTileHeight = f trackTile.height;
  onTrackSwipeLeft = trackTile.swipeActions.left;
  onTrackSwipeRight = trackTile.swipeActions.right;
  displayThirdRow = thirdRow;
  displayThirdItemInEachRow = thirdItemEachRow;
  trackTileSeparator = itemsSeparator;
  displayFavouriteIconInListTile = favoriteButton;
  trackItem =
    let
      inherit (miniPlayer.layout) row1;
      inherit (miniPlayer.layout) row2;
      inherit (miniPlayer.layout) row3;
    in
    {
      row1Item1 = row1.element1;
      row1Item2 = row1.element2;
      row1Item3 = row1.element3;

      row2Item1 = row2.element1;
      row2Item2 = row2.element2;
      row2Item3 = row2.element3;

      row3Item1 = row3.element1;
      row3Item2 = row3.element2;
      row3Item3 = row3.element3;

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
