# Namida Configuration with Nix

<!--toc:start-->

- [Namida Configuration with Nix](#namida-configuration-with-nix)
  - [Setup](#setup)
    - [programs.namida.enable](#programsnamidaenable)
    - [programs.namida.useBetaPackage](#programsnamidausebetapackage)
    - [programs.namida.ytSupport](#programsnamidaytsupport)
    - [programs.namida.icon](#programsnamidaicon)
  - [Configuration](#configuration)
    - [programs.namida.settingsRaw](#programsnamidasettingsraw)
    - [programs.namida.settingsRaw.enable](#programsnamidasettingsrawenable)
    - [programs.namida.settingsRaw.config](#programsnamidasettingsrawconfig)
    - [programs.namida.settingsRaw.merge](#programsnamidasettingsrawmerge)
    - [programs.namida.settings](#programsnamidasettings)
    - [cfg.enable](#cfgenable)
    - [Appearance](#appearance)
      - [cfg.appearance](#cfgappearance)
      - [cfg.appearance.mode](#cfgappearancemode)
      - [cfg.appearance.forceMiniPlayerFollowTrackColors](#cfgappearanceforceminiplayerfollowtrackcolors)
      - [cfg.appearance.pitchBlack](#cfgappearancepitchblack)
      - [cfg.appearance.autoColor](#cfgappearanceautocolor)
      - [cfg.appearance.animatedTheme](#cfgappearanceanimatedtheme)
      - [cfg.appearance.staticColors](#cfgappearancestaticcolors)
      - [cfg.appearance.staticColors.dark and cfg.appearance.staticColors.light](#cfgappearancestaticcolorsdark-and-cfgappearancestaticcolorslight)
    - [Indexer](#indexer)
      - [cfg.indexer.featuredArtistsFromTitle](#cfgindexerfeaturedartistsfromtitle)
      - [cfg.indexer.respectNoMedia](#cfgindexerrespectnomedia)
      - [cfg.indexer.preventDuplicates](#cfgindexerpreventduplicates)
      - [cfg.indexer.indexVideos](#cfgindexerindexvideos)
      - [cfg.indexer.minimumFileSize](#cfgindexerminimumfilesize)
      - [cfg.indexer.minimumTrackDuration](#cfgindexerminimumtrackduration)
      - [cfg.indexer.refreshOnStartup](#cfgindexerrefreshonstartup)
      - [cfg.indexer.artworkCache.enable](#cfgindexerartworkcacheenable)
      - [cfg.indexer.artworkCache.groupArtworksByAlbum](#cfgindexerartworkcachegroupartworksbyalbum)
      - [cfg.indexer.artworkCache.hash](#cfgindexerartworkcachehash)
      - [cfg.indexer.genresSeparators](#cfgindexergenresseparators)
      - [cfg.indexer.artistsSeparators](#cfgindexerartistsseparators)
      - [cfg.indexer.albumIdentifiers](#cfgindexeralbumidentifiers)
      - [cfg.indexer.folders.include](#cfgindexerfoldersinclude)
      - [cfg.indexer.folders.exclude](#cfgindexerfoldersexclude)
    - [Customization](#customization)
      - [cfg.customization.floatingActionButton](#cfgcustomizationfloatingactionbutton)
      - [cfg.customization.navigationBar.defaultTab](#cfgcustomizationnavigationbardefaulttab)
      - [cfg.customization.navigationBar.disposition](#cfgcustomizationnavigationbardisposition)
      - [cfg.customization.blur](#cfgcustomizationblur)
      - [cfg.customization.glow](#cfgcustomizationglow)
      - [cfg.customization.parallax](#cfgcustomizationparallax)
      - [cfg.customization.time12h](#cfgcustomizationtime12h)
      - [cfg.customization.dateTimeFormat](#cfgcustomizationdatetimeformat)
      - [cfg.customization.borderRadius](#cfgcustomizationborderradius)
      - [cfg.customization.fontScale](#cfgcustomizationfontscale)
      - [cfg.customization.thirdRow](#cfgcustomizationthirdrow)
      - [cfg.customization.thirdItemEachRow](#cfgcustomizationthirditemeachrow)
      - [cfg.customization.favoriteButton](#cfgcustomizationfavoritebutton)
      - [cfg.customization.itemsSeparator](#cfgcustomizationitemsseparator)
      - [cfg.customization.albumTile](#cfgcustomizationalbumtile)
      - [cfg.customization.albumTile.displayTrackNumber](#cfgcustomizationalbumtiledisplaytracknumber)
      - [cfg.customization.albumTile.topRightDate](#cfgcustomizationalbumtiletoprightdate)
      - [cfg.customization.albumTile.staggeredGridview](#cfgcustomizationalbumtilestaggeredgridview)
      - [cfg.customization.albumTile.height](#cfgcustomizationalbumtileheight)
      - [cfg.customization.albumTile.thumbnails.size](#cfgcustomizationalbumtilethumbnailssize)
      - [cfg.customization.albumTile.thumbnails.squared](#cfgcustomizationalbumtilethumbnailssquared)
      - [cfg.customization.trackTile](#cfgcustomizationtracktile)
      - [cfg.customization.trackTile.height](#cfgcustomizationtracktileheight)
      - [cfg.customization.trackTile.thumbnails.size](#cfgcustomizationtracktilethumbnailssize)
      - [cfg.customization.trackTile.thumbnails.squared](#cfgcustomizationtracktilethumbnailssquared)
      - [cfg.customization.trackTile.swipeActions](#cfgcustomizationtracktileswipeactions)
      - [cfg.customization.trackTile.swipeActions.left](#cfgcustomizationtracktileswipeactionsleft)
      - [cfg.customization.trackTile.swipeActions.right](#cfgcustomizationtracktileswipeactionsright)
      - [cfg.customization.miniPlayer.layout](#cfgcustomizationminiplayerlayout)
      - [cfg.customization.miniPlayer.layout.row1.element1](#cfgcustomizationminiplayerlayoutrow1element1)
      - [cfg.customization.miniPlayer.layout.row1.element2](#cfgcustomizationminiplayerlayoutrow1element2)
      - [cfg.customization.miniPlayer.layout.row1.element3](#cfgcustomizationminiplayerlayoutrow1element3)
      - [cfg.customization.miniPlayer.layout.row2.element1](#cfgcustomizationminiplayerlayoutrow2element1)
      - [cfg.customization.miniPlayer.layout.row2.element2](#cfgcustomizationminiplayerlayoutrow2element2)
      - [cfg.customization.miniPlayer.layout.row2.element3](#cfgcustomizationminiplayerlayoutrow2element3)
      - [cfg.customization.miniPlayer.layout.row3.element1](#cfgcustomizationminiplayerlayoutrow3element1)
      - [cfg.customization.miniPlayer.layout.row3.element2](#cfgcustomizationminiplayerlayoutrow3element2)
      - [cfg.customization.miniPlayer.layout.row3.element3](#cfgcustomizationminiplayerlayoutrow3element3)
      - [cfg.customization.miniPlayer.layout.rightItem1](#cfgcustomizationminiplayerlayoutrightitem1)
      - [cfg.customization.miniPlayer.layout.rightItem2](#cfgcustomizationminiplayerlayoutrightitem2)
      - [cfg.miniPlayer.customization](#cfgminiplayercustomization)
      - [cfg.customization.miniPlayer.customization.party](#cfgcustomizationminiplayercustomizationparty)
      - [cfg.customization.miniPlayer.customization.edgeColorsSwitching](#cfgcustomizationminiplayercustomizationedgecolorsswitching)
      - [cfg.customization.miniPlayer.customization.movingParticles](#cfgcustomizationminiplayercustomizationmovingparticles)
      - [cfg.customization.miniPlayer.customization.thumbnailAnimations.intensity.expandedMiniPlayer](#cfgcustomizationminiplayercustomizationthumbnailanimationsintensityexpandedminiplayer)
      - [cfg.customization.miniPlayer.customization.thumbnailAnimations.intensity.lyrics](#cfgcustomizationminiplayercustomizationthumbnailanimationsintensitylyrics)
      - [cfg.customization.miniPlayer.customization.thumbnailAnimations.intensity.minimizedMiniPlayer](#cfgcustomizationminiplayercustomizationthumbnailanimationsintensityminimizedminiplayer)
      - [cfg.customization.miniPlayer.customization.thumbnailAnimations.invert](#cfgcustomizationminiplayercustomizationthumbnailanimationsinvert)
      - [cfg.customization.miniPlayer.customization.waveformBarsCount](#cfgcustomizationminiplayercustomizationwaveformbarscount)
      - [cfg.customization.miniPlayer.customization.displayAudioInfo](#cfgcustomizationminiplayercustomizationdisplayaudioinfo)
      - [cfg.customization.miniPlayer.customization.artistBeforeTitle](#cfgcustomizationminiplayercustomizationartistbeforetitle)
      - [cfg.customization.miniPlayer.customization.artworkGestures.scaleMultiplier](#cfgcustomizationminiplayercustomizationartworkgesturesscalemultiplier)
      - [cfg.customization.miniPlayer.customization.artworkGestures.dt2ToggleLyrics](#cfgcustomizationminiplayercustomizationartworkgesturesdt2togglelyrics)
      - [cfg.customization.miniPlayer.customization.artworkGestures.actions](#cfgcustomizationminiplayercustomizationartworkgesturesactions)
      - [cfg.customization.miniPlayer.customization.artworkGestures.actions.click](#cfgcustomizationminiplayercustomizationartworkgesturesactionsclick)
      - [cfg.customization.miniPlayer.customization.artworkGestures.actions.longPress](#cfgcustomizationminiplayercustomizationartworkgesturesactionslongpress)
    - [Other](#other)
      - [Player](#player)
        - [cfg.player.gaplessPlayback](#cfgplayergaplessplayback)
        - [cfg.player.lyrics](#cfgplayerlyrics)
        - [cfg.player.lyrics.prioritizeEmbedded](#cfgplayerlyricsprioritizeembedded)
        - [cfg.player.lyrics.sources](#cfgplayerlyricssources)
        - [cfg.player.lyrics.stretchDuration](#cfgplayerlyricsstretchduration)
        - [cfg.player.imagesSources](#cfgplayerimagessources)
        - [cfg.player.imagesSources.albums](#cfgplayerimagessourcesalbums)
        - [cfg.player.imagesSources.artists](#cfgplayerimagessourcesartists)
      - [Language](#language)
        - [cfg.language](#cfglanguage)
      - [cacheSizes](#cachesizes)
        - [cfg.cacheSizes.image](#cfgcachesizesimage)
        - [cfg.cacheSizes.audio](#cfgcachesizesaudio)
        - [cfg.cacheSizes.video](#cfgcachesizesvideo)
      - [Backup](#backup)
        - [cfg.backup.location](#cfgbackuplocation)
        - [cfg.backup.autoBackupInterval](#cfgbackupautobackupinterval)
    - [Experimentals](#experimentals)
      - [cfg.misc.tapToScroll](#cfgmisctaptoscroll)
      - [cfg.misc.enhancedDragToScroll](#cfgmiscenhanceddragtoscroll)
      - [cfg.misc.smoothScrolling](#cfgmiscsmoothscrolling)
      - [cfg.misc.tiltingCardsEffect](#cfgmisctiltingcardseffect)
      - [cfg.misc.gradientTilesAndCards](#cfgmiscgradienttilesandcards)
      - [cfg.misc.windowDecorations](#cfgmiscwindowdecorations)
      - [cfg.misc.windowDecorations.enable](#cfgmiscwindowdecorationsenable)
      - [cfg.misc.windowDecorations.type](#cfgmiscwindowdecorationstype)
      - [cfg.misc.ytStylePlayerButtonSwitcher](#cfgmiscytstyleplayerbuttonswitcher)
      - [cfg.misc.preferredSearchTab](#cfgmiscpreferredsearchtab)

<!--toc:end-->

## Setup

### programs.namida.enable

Whether to install Namida.

Type: bool

Default: `false`

### programs.namida.useBetaPackage

Whether to install the very latest snapshot version, instead of `5.8.7-beta`.

Type: bool

Default: `false`

### programs.namida.ytSupport

Whether to install dependencies required for youtube(login) support, as well as
a dedicated package for it.

> [!NOTE]
> ytSupport depends on a library not packaged on nixpkgs(wpewebkit). As such, I
> recommend following [this guide](https://garnix.io/docs/ci/caching) to enable
> the Garnix substituter on your `configuration.nix`.

> [!WARNING]
> Currently, ytSupport is marked as broken.

Type: bool

Default: `false`

### programs.namida.icon

One of

- `"tired"`
- `"spooky"`
- `"space"`
- `"shade"`
- `"original"`
- `"namiween"`
- `"namichin"`
- `"hollow"`
- `"glowy"`
- `"enhanced"`
- `"eddy"`
- `"cutsie"`
- `"default"`

> [!NOTE]
> If you want to preview the icons, check out
> [https://codeberg.org/iWisp360/namida-icons]

Type: str

Default: `"default"`

## Configuration

### programs.namida.settingsRaw

This module uses JQ to safely merge all options defined within this module,
while other settings remain untouched. If an option is not provided, you may
define it directly by knowing the json key.

### programs.namida.settingsRaw.enable

Whether to enable directly set json keys.

Type: bool

Default: `false`

### programs.namida.settingsRaw.config

Define valida namida json keys here. Written to
`~/.namida/namida_settings.json`.

Type: Attribute Set

Default: `{}`

### programs.namida.settingsRaw.merge

Whether to merge values set here with values defined in
`programs.namida.settings`.

Type: bool

Default: `true`

### programs.namida.settings

> [!NOTE]
> At this point, this documentation page assumes `cfg` is
> `programs.namida.settings`

### cfg.enable

Whether to configure Namida through this module and use the Namida defaults,
loaded from here.

Type: bool

Default: `false`

### Appearance

#### cfg.appearance

Appearance related configurations for the player, like theming and so.

#### cfg.appearance.mode

Can take three values: "dark", "light", "system"

Type: str

Default: `"system"`

#### cfg.appearance.forceMiniPlayerFollowTrackColors

Whether miniplayer should take track's artwork colors

Type: bool

Default: `false`

#### cfg.appearance.pitchBlack

Whether to set pitch black background

Type: bool

Default: `false`

#### cfg.appearance.autoColor

Whether to automatically pick player colors from music's artwork

Type: bool

Default: `true`

#### cfg.appearance.animatedTheme

Whether to animate theme, not sure about this one :V

Type: bool

Default: `true`

#### cfg.appearance.staticColors

The values set here are ignored if `cfg.appearance.autoColor` is set to `true`

#### cfg.appearance.staticColors.dark and cfg.appearance.staticColors.light

Takes a Hexadecimal Hash color, in RGBA format.

Type: str

Default: light: `"#9c99c1ff"` dark: `"#4e4c72ff"`

### Indexer

#### cfg.indexer.featuredArtistsFromTitle

Whether to extract (feat. X) and (ft. X) artists.

Type: bool

Default: `true`

#### cfg.indexer.respectNoMedia

Whether to exclude folders where `.nomedia` is found.

Type: bool

Default: `false`

#### cfg.indexer.preventDuplicates

Whether to use filename to remove duplicates of a same track.

Type: bool

Default: `false`

#### cfg.indexer.indexVideos

Whether to index videos.

Type: bool

Default: `true`

#### cfg.indexer.minimumFileSize

Define minimum file size for tracks to be indexed, in bytes.

Type: int

Default: `102400`

#### cfg.indexer.minimumTrackDuration

Define minimum track duration for tracks to be indexed, in seconds.

Type: int

Default: `25`

#### cfg.indexer.refreshOnStartup

Whether to refresh index on startup.

Type: bool

Default: `false`

#### cfg.indexer.artworkCache.enable

Whether to cache artworks.

Type: bool

Default: `true`

#### cfg.indexer.artworkCache.groupArtworksByAlbum

Whether to group artworks from different tracks in albums.

Type: bool

Default: `false`

#### cfg.indexer.artworkCache.hash

Whether to hash artworks.

Type: bool

Default: `false`

#### cfg.indexer.genresSeparators

Strings that separate genres in metadata.

Type: listOf str

Default: `[ "&" "," ";" "//" "x" ]`

#### cfg.indexer.artistsSeparators

Strings that separate artists in metadata.

Type: listOf str

Default: `[ "&" "," ";" "//" "ft." "x" ]`

#### cfg.indexer.albumIdentifiers

Elements to identify albums. Valid values are `"albumName"`, `"year"`, or
`"albumArtist"`.

Type: listOf str

Default: `[ "albumName" ]`

#### cfg.indexer.folders.include

Paths that will be indexed by namida.

Type: listOf str

Default:
`[ "${config.home.homeDirectory}/Music" "${config.home.homeDirectory}/Namida" ]`

#### cfg.indexer.folders.exclude

Paths that will not be indexed by namida.

Type: listOf str

Default: `[ ]`

### Customization

#### cfg.customization.floatingActionButton

Floating Action Button in player.

Type: str

One of

- `"none"`
- `"play"`
- `"shuffle"`
- `"search"`

Default: `"none"`

#### cfg.customization.navigationBar.defaultTab

The tab that opens by default when the application starts.

Type: str

One of

- `"home"`
- `"albums"`
- `"tracks"`
- `"artists"`
- `"genres"`
- `"playlists"`
- `"folders"`
- `"foldersMusic"`
- `"foldersVideos"`
- `"search"`
- `"youtube"`

Default: `"tracks"`

#### cfg.customization.navigationBar.disposition

The order and selection of tabs displayed in the navigation bar.

See `defaultTab` for valid values.

Type: listOf str

Default: `[ "home" "tracks" "artists" "playlists" "folders" "youtube" ]`

#### cfg.customization.blur

Whether to enable blur.

Type: bool

Default: `false`

#### cfg.customization.glow

Whether to enable glow.

Type: bool

Default: `false`

#### cfg.customization.parallax

Whether to enable parallax.

Type: bool

Default: `true`

#### cfg.customization.time12h

Whether to display time in 12h format.

Type: bool

Default: `true`

#### cfg.customization.dateTimeFormat

Format for displaying date and time.

Type: str

Default: `"MMM yyyy"`

#### cfg.customization.borderRadius

Multiplier for borders radius.

Type: float

Default: `1.0`

#### cfg.customization.fontScale

Define font size.

Type: float

Default: `0.9`

#### cfg.customization.thirdRow

Whether to display third row.

Type: bool

Default: `true`

#### cfg.customization.thirdItemEachRow

Whether to display a third item in each row.

Type: bool

Default: `false`

#### cfg.customization.favoriteButton

Whether to display favorite button.

Type: bool

Default: `true`

#### cfg.customization.itemsSeparator

String that separates elements of a track.

Type: str

Default: `"•"`

#### cfg.customization.albumTile

Configurations for album tiles in player.

#### cfg.customization.albumTile.displayTrackNumber

Whether to display a small box containing the track number in the album page.

Type: bool

Default: `true`

#### cfg.customization.albumTile.topRightDate

Whether to display album date at Album Card's top right.

Type: bool

Default: `true`

#### cfg.customization.albumTile.staggeredGridview

Whether to add spacing to thumbnail for uniform arrangement.

Type: bool

Default: `false`

#### cfg.customization.albumTile.height

Height for all album tiles.

Type: int

Default: `90`

#### cfg.customization.albumTile.thumbnails.size

Size of album thumbails.

Type: int

Default: `90`

#### cfg.customization.albumTile.thumbnails.squared

Whether to force square album thumbnails.

Type: bool

Default: `false`

#### cfg.customization.trackTile

Configurations for track tiles in player.

#### cfg.customization.trackTile.height

Height for all track tiles.

Type: int

Default: `90`

#### cfg.customization.trackTile.thumbnails.size

Size of track thumbails.

Type: int

Default: `90`

#### cfg.customization.trackTile.thumbnails.squared

Whether to force square track thumbnails.

Type: bool

Default: `false`

#### cfg.customization.trackTile.swipeActions

One of

- `"openinfo"`
- `"none"`
- `"playnext"`
- `"playlast"`
- `"playafter"`
- `"addtoplaylist"`
- `"openArtwork"`
- `"editArtwork"`
- `"saveArtwork"`
- `"editTags"`
- `"setRating"`
- `"openListens"`
- `"goToAlbum"`
- `"goToArtist"`
- `"goToFolder"`
- `"copyTitle"`
- `"copyArtist"`
- `"copyArtistAndTitle"`
- `"copyYTLink"`
- `"searchYTSimilar"`
- `"delete"`

#### cfg.customization.trackTile.swipeActions.left

Action when swiping track to the left.

Type: str

Default: `"playafter"`

#### cfg.customization.trackTile.swipeActions.right

Action when swiping track to the right.

Type: str

Default: `"openinfo"`

#### cfg.customization.miniPlayer.layout

Valid elements are one of

- `"none"`
- `"title"`
- `"album"`
- `"artists"`
- `"albumArtist"`
- `"genres"`
- `"composer"`
- `"trackNumber"`
- `"discNumber"`
- `"duration"`
- `"year"`
- `"size"`
- `"dateAdded"`
- `"dateModified"`
- `"dateModifiedDate"`
- `"dateModifiedClock"`
- `"path"`
- `"folder"`
- `"fileName"`
- `"fileNameWOExt"`
- `"extension"`
- `"comment"`
- `"bitrate"`
- `"sampleRate"`
- `"format"`
- `"channels"`
- `"rating"`
- `"tags"`
- `"moods"`
- `"listenCount"`
- `"latestListenDate"`
- `"firstListenDate"`

#### cfg.customization.miniPlayer.layout.row1.element1

Type: str

Default: `"title"`

#### cfg.customization.miniPlayer.layout.row1.element2

Type: str

Default: `"none"`

#### cfg.customization.miniPlayer.layout.row1.element3

Type: str

Default: `"none"`

#### cfg.customization.miniPlayer.layout.row2.element1

Type: str

Default: `"artists"`

#### cfg.customization.miniPlayer.layout.row2.element2

Type: str

Default: `"none"`

#### cfg.customization.miniPlayer.layout.row2.element3

Type: str

Default: `"none"`

#### cfg.customization.miniPlayer.layout.row3.element1

Type: str

Default: `"album"`

#### cfg.customization.miniPlayer.layout.row3.element2

Type: str

Default: `"year"`

#### cfg.customization.miniPlayer.layout.row3.element3

Type: str

Default: `"none"`

#### cfg.customization.miniPlayer.layout.rightItem1

Type: str

Default: `"duration"`

#### cfg.customization.miniPlayer.layout.rightItem2

Type: str

Default: `"none"`

#### cfg.miniPlayer.customization

#### cfg.customization.miniPlayer.customization.party

Whether to enable party effect.

Type: bool

Default: `false`

#### cfg.customization.miniPlayer.customization.edgeColorsSwitching

Whether to switch colors in party effect.

Type: bool

Default: `true`

#### cfg.customization.miniPlayer.customization.movingParticles

Whether to enable moving particles effect.

Type: bool

Default: `true`

#### cfg.customization.miniPlayer.customization.thumbnailAnimations.intensity.expandedMiniPlayer

Intensity of thumbnails animations, described in a percentage divisible by 4.

Type: int from 0 to 100

Default: `100`

#### cfg.customization.miniPlayer.customization.thumbnailAnimations.intensity.lyrics

Intensity of thumbnails animations, described in a percentage divisible by 4.

Type: int from 0 to 100

Default: `40`

#### cfg.customization.miniPlayer.customization.thumbnailAnimations.intensity.minimizedMiniPlayer

Intensity of thumbnails animations, described in a percentage divisible by 4.

Type: int from 0 to 100

Default: `40`

#### cfg.customization.miniPlayer.customization.thumbnailAnimations.invert

Whether to invert animations.

Type: bool

Default: `false`

#### cfg.customization.miniPlayer.customization.waveformBarsCount

Amount of bars for the waveform of the track.

Type: int from 40 to 400

Default: `80`

#### cfg.customization.miniPlayer.customization.displayAudioInfo

Whether to display audio info in player.

Type: bool

Default: `false`

#### cfg.customization.miniPlayer.customization.artistBeforeTitle

Whether to display artist before title.

Type: bool

Default: `true`

#### cfg.customization.miniPlayer.customization.artworkGestures.scaleMultiplier

Multiplier for artwork gestures.

Type: float

Default: `1.0`

#### cfg.customization.miniPlayer.customization.artworkGestures.dt2ToggleLyrics

Whether to open lyrics by double clicking the track's artwork.

Type: bool

Default: `true`

#### cfg.customization.miniPlayer.customization.artworkGestures.actions

Valid actions are one of

- `"none"`
- `"playnext"`
- `"playlast"`
- `"playafter"`
- `"addtoplaylist"`
- `"openinfo"`
- `"openArtwork"`
- `"editArtwork"`
- `"saveArtwork"`
- `"editTags"`
- `"setRating"`
- `"openListens"`
- `"goToAlbum"`
- `"goToArtist"`
- `"goToFolder"`
- `"copyTitle"`
- `"copyArtist"`
- `"copyArtistAndTitle"`
- `"copyYTLink"`
- `"searchYTSimilar"`
- `"delete"`

#### cfg.customization.miniPlayer.customization.artworkGestures.actions.click

Action on artwork click.

Type: str

Default: `"none"`

#### cfg.customization.miniPlayer.customization.artworkGestures.actions.longPress

Action on artwork long press.

Type: str

Default: `"none"`

### Other

#### Player

##### cfg.player.gaplessPlayback

Whether to enable Gapless Playback

Type: bool

Default: `false`

##### cfg.player.lyrics

Lyrics related options in player.

##### cfg.player.lyrics.prioritizeEmbedded

Whether to prefer track embedded lyrics over lyrics from internet sources.

Type: bool

Default: `false`

##### cfg.player.lyrics.sources

Source to get lyrics from.

Type: str

One of

- `"auto"`
- `"local"`
- `"internet"`

Default: `"auto"`

##### cfg.player.lyrics.stretchDuration

Whether to stretch lyrics duration

Type: bool

Default: `true`

##### cfg.player.imagesSources

Configuration for tracks images sources

Valid sources are

- `"local"`
- `"lastfm"`

##### cfg.player.imagesSources.albums

Source to get albums images from

Type: listOf str

Default: `[ "lastfm" "local" ]`

##### cfg.player.imagesSources.artists

Source to get artists images from

Type: listOf str

Default: `[ "lastfm" "local" ]`

#### Language

##### cfg.language

Define language used by namida. Check
[availableLanguages.nix](./nix/availableLanguages.nix) to see supported
languages.

Type: str

Default: $LANG value or `"en_US.UTF-8"`

#### cacheSizes

Max Cache sizes, in MiB.

##### cfg.cacheSizes.image

Type: int

Default: `256`

##### cfg.cacheSizes.audio

Type: int

Default: `4096`

##### cfg.cacheSizes.video

Type: int

Default: `8192`

#### Backup

##### cfg.backup.location

Location defined to store Namida backups.

Type: str

Default `"${config.home.homeDirectory}/Namida/Backups"`

##### cfg.backup.autoBackupInterval

Interval in which Namida creates new backups, in days. Set to 0 to disable
backups.

Type: int

Default: `7`

### Experimentals

#### cfg.misc.tapToScroll

Whether to scroll by tapping on the scroll track.

Type: bool

Default: `false`

#### cfg.misc.enhancedDragToScroll

Whether to drag anywhere on the scroll track to scroll.

Type: bool

Default: `true`

#### cfg.misc.smoothScrolling

Whether to enable smooth scrolling.

Type: bool

Default: `true`

#### cfg.misc.tiltingCardsEffect

Whether to enable tilting cards effect.

Type: bool

Default: `false`

#### cfg.misc.gradientTilesAndCards

Whether to enable gradient tiles and cards.

Type: bool

Default: `true`

#### cfg.misc.windowDecorations

Configurations for the CSD(Client-Side Decorations) from Namida.

#### cfg.misc.windowDecorations.enable

Whether to enable Window decorations

Type: bool

Default: `true`

#### cfg.misc.windowDecorations.type

Style for minimize, maximize and close buttons.

Type: str

One of

- `"auto"`
- `"adwaita"`
- `"arc"`
- `"breeze"`
- `"elementary"`
- `"flatRemix"`
- `"materia"`
- `"nordic"`
- `"osxArc"`
- `"pop"`
- `"unity"`
- `"vimix"`
- `"yaru"`

Default: `"auto"`

#### cfg.misc.ytStylePlayerButtonSwitcher

Whether to enable Youtube Style Player button switcher.

Type: bool

Default: `false`

#### cfg.misc.preferredSearchTab

Preferred Search Tab

Type: str

One of

- `"localTracks"`
- `"youtube"`
- `"auto"`

Default: `"auto"`
