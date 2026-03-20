{ types, mkOption }:
mkOption {
  default = { };
  type = types.submodule {
    options = {
      lyrics = mkOption {
        default = { };
        type = types.submodule {
          options = {
            prioritizeEmbedded = mkOption {
              type = types.bool;
              default = true;
              description = "Whether to prefer track embedded lyrics over lyrics from internet sources";
            };

            source = mkOption {
              type = types.enum [
                "auto"
                "local"
                "internet"
              ];

              default = "auto";
              description = "Internet source to get lyrics from";
            };

            stretchDuration = mkOption {
              type = types.bool;
              default = true;
              description = "Whether to stretch lyrics duration";
            };
          };
        };
      };

      imagesSource =
        let
          sources = [
            "local"
            "lastfm"
          ];
        in
        mkOption {
          default = { };
          type = types.submodule {
            options = {
              albums = mkOption {
                type = types.enum sources;
                default = "";
                description = "Internet source to get albums images from";
              };

              artists = mkOption {
                type = types.enum sources;
                default = "";
                description = "Internet source to get artists images from";
              };
            };
          };
        };
    };
  };
}
