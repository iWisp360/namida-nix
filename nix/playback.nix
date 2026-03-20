{
  types,
  mkOption,
}:
mkOption {
  type = types.submodule {
    options = {
      video = mkOption {
        type = types.submodule {
          enable = mkOption {
            type = types.bool;
            # default = ;
            description = "Whether to enable video playback";
          };

          videoSource = mkOption {
          };

          videoQuality = mkOption {
          };

          localVideoMatching = mkOption {
          };
        };
      };

      keepScreenAwake = mkOption {
        type = types.str;
        # default = ;
        description = "Condition to keep screen awake";
      };

      normalize = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to normalize volume by reading the replay gain tag or the info provided by youtube";
      };

      crossfade = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to enable crossfade effect";
      };

      fadeEffect = mkOption {
        default = { };
        type = types.submodule {
          options = {
            enable = mkOption {
              type = types.bool;
              default = true;
              description = "Whether to enable fade effect when changing play/pause state";
            };

            playDuration = mkOption {
              type = types.int;
              default = 300;
              description = "Fade effect duration when playing, in milliseconds";
            };

            pauseDuration = mkOption {
              type = types.int;
              default = 300;
              description = "Fade effect duration when pausing, in milliseconds";
            };
          };
        };
      };

      autoPlayNextPrev = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to start playing automatically when changing to the next or previous item";
      };

      infinityQueueNextPrev = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to loop from last to first when playing a queue of items";
      };

      onMute = mkOption {
        default = { };
        type = types.submodule {
          options = {
            pause = mkOption {
              type = types.bool;
              default = true;
              description = "Whether to pause playback when volume is muted";
            };

            resumeTimeout = mkOption {
              type = types.int;
              default = 5;
              description = "Resume playback if the pause time was lower than the specified time, in minutes";
            };
          };
        };
      };
    };
  };
}
