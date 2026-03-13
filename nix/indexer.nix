{
  types,
  mkOption,
  mkEnableOption,
}:
mkOption {
  type = types.submodule {
    options = {
      featuredArtistsFromTitle = mkEnableOption "Whether to extract (feat. X) and (ft. X) artists";
      respectNoMedia = mkEnableOption "Whether to exclude folders where .nomedia is found";
      preventDuplicates = mkEnableOption "Whether to use filename to remove duplicates of a same track";
      indexVideos = mkEnableOption "Whether to index videos";
      minimumFileSize = mkOption {
        type = types.int;
        description = "Define minimum file size for tracks to be indexed, in bytes";
      };

      minimumTrackDuration = mkOption {
        type = types.int;
        description = "Define minimum track duration for tracks to be indexed, in seconds";
      };

      refreshOnStartup = mkEnableOption "Whether to refresh index on startup";
      artworkCache = mkOption {
        type = types.submodule {
          options = {
            enable = mkEnableOption "Whether to cache artworks";
            groupArtworksByAlbum = mkEnableOption "Whether to group artworks from different tracks in albums";
            hash = mkEnableOption "Whether to hash artworks";
          };
        };
      };

      genresSeparators = mkOption {
        type = types.listOf types.str;
        description = "Strings that separate genres in metadata";
      };

      artistsSeparators = mkOption {
        type = types.listOf types.str;
        description = "Strings that separate artists in metadata";
      };

      albumIdentifiers = mkOption {
        type = types.listOf (types.strMatching "(albumName|year|albumArtist)");
        description = "Elements to identify albums";
      };

      folders = mkOption {
        type = types.submodule {
          options = {
            include = mkOption {
              type = types.listOf types.str;
              description = "Paths that will be indexed by namida";
            };

            exclude = mkOption {
              type = types.listOf types.str;
              description = "Paths that will not be indexed by namida";
            };
          };
        };
      };
    };
  };
}
