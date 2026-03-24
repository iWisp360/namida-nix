{ types, mkOption }:
# These settings are a bit hidden, so they are here instead of common places
mkOption {
  default = { };
  type = types.submodule {
    options = {
      tapToScroll = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to scroll by tapping on the scroll track";
      };

      enhancedDragToScroll = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to drag anywhere on the scroll track to scroll";
      };

      smoothScrolling = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to enable smooth scrolling";
      };

      tiltingCardsEffect = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to enable tilting cards effect";
      };

      gradientTilesAndCards = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to enable gradient tiles and cards";
      };

      windowDecorations = mkOption {
        default = { };
        type = types.submodule {
          options = {
            enable = mkOption {
              type = types.bool;
              default = true;
              description = "Whether to enable Window decorations";
            };

            type = mkOption {
              type = types.enum [
                "auto"
                "adwaita"
                "arc"
                "breeze"
                "elementary"
                "flatRemix"
                "materia"
                "nordic"
                "osxArc"
                "pop"
                "unity"
                "vimix"
                "yaru"
              ];

              default = "auto";
            };
          };
        };
      };

      ytStylePlayerButtonSwitcher = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to enable Youtube Style Player button switcher";
      };

      preferredSearchTab = mkOption {
        type = types.enum [
          "localTracks"
          "youtube"
          "auto"
        ];

        default = "auto";
        description = "Preferred Search Tab";
      };
    };
  };
}
