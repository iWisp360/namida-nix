{
  types,
  mkOption,
  config,
}:
mkOption {
  default = { };
  type = types.submodule {
    options = {
      featuredArtistsFromTitle = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to extract (feat. X) and (ft. X) artists";
      };

      respectNoMedia = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to exclude folders where .nomedia is found";
      };

      preventDuplicates = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to use filename to remove duplicates of a same track";
      };

      indexVideos = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to index videos";
      };

      minimumFileSize = mkOption {
        type = types.int;
        default = 102400;
        description = "Define minimum file size for tracks to be indexed, in bytes";
      };

      minimumTrackDuration = mkOption {
        type = types.int;
        default = 25;
        description = "Define minimum track duration for tracks to be indexed, in seconds";
      };

      refreshOnStartup = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to refresh index on startup";
      };

      artworkCache = mkOption {
        default = { };
        type = types.submodule {
          options = {
            enable = mkOption {
              type = types.bool;
              default = true;
              description = "Whether to cache artworks";
            };

            groupArtworksByAlbum = mkOption {
              type = types.bool;
              default = false;
              description = "Whether to group artworks from different tracks in albums";
            };

            hash = mkOption {
              type = types.bool;
              default = false;
              description = "Whether to hash artworks";
            };
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
        type = types.listOf (types.strMatching "(albumName|year|albumArtist)");
        default = [ "albumName" ];
        description = "Elements to identify albums";
      };

      folders = mkOption {
        default = { };
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
}
