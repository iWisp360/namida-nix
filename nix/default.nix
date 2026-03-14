{ config }:
{
  enable = false;
  language = config.i18n.defaultLocale;
  appearance = {
    mode = "system";
    forceMiniPlayerFollowTrackColors = false;
    pitchBlack = false;
    autoColor = true;
    animatedTheme = true;
    staticColors = {
      light = "#9c99c1ff";
      dark = "#4e4c72ff";
    };
  };

  customization = {
    blur = false;
    glow = false;
    parallax = true;
    time12h = true;
    dateTimeFormat = "MMM yyyy";
    borderRadius = 1.0;
    fontScale = 0.9;
    albumTile = {
      displayTrackNumber = true;
      topRightDate = true;
      staggeredGridview = false;
      height = 90;
      thumbnails = {
        size = 90;
        squared = false;
      };
    };

    trackTile = {
      height = 90;
      thumbnails = {
        size = 90;
        squared = false;
      };

      swipeActions = {
        left = "playafter";
        right = "openinfo";
      };
    };

    thirdRow = true;
    thirdItemEachRow = false;
    favoriteButton = true;
    itemsSeparator = "•";
    miniPlayer = {
      layout = {
        row1 = {
          element1 = "title";
          element2 = "none";
          element3 = "none";
        };

        row2 = {
          element1 = "artists";
          element2 = "none";
          element3 = "none";
        };

        row3 = {
          element1 = "album";
          element2 = "year";
          element3 = "none";
        };

        rightItem1 = "duration";
        rightItem2 = "none";
      };

      customization = {
        party = false;
        edgeColorsSwitching = true;
        movingParticles = true;
        thumbnailAnimations = {
          intensity = {
            expandedMiniPlayer = 100;
            lyrics = 40;
            minimizedMiniPlayer = 40;
          };

          invert = false;
        };

        artworkGestures = {
          scaleMultiplier = 1.0;
          dt2ToggleLyrics = true;
          actions = {
            click = "none";
            longPress = "none";
          };
        };

        waveformBarsCount = 80;
        displayAudioInfo = false;
        artistBeforeTitle = true;
      };
    };
  };

  indexer = {
    featuredArtistsFromTitle = true;
    respectNoMedia = false;
    preventDuplicates = false;
    indexVideos = true;
    minimumFileSize = 102400;
    minimumTrackDuration = 25;
    refreshOnStartup = false;
    artworkCache = {
      enable = true;
      groupArtworksByAlbum = false;
      hash = false;
    };

    genresSeparators = [
      "&"
      ","
      ";"
      "//"
      "x"
    ];

    artistsSeparators = [
      "&"
      ","
      ";"
      "//"
      "ft."
      "x"
    ];

    albumIdentifiers = [ "albumName" ];

    folders = {
      include = [
        "${config.home.homeDirectory}/Music"
        "${config.home.homeDirectory}/Namida"
      ];

      exclude = [ ];
    };
  };
}
