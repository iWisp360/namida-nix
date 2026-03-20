{
  config,
  lib,
  home-manager,
  pkgs,
  osConfig,
  jq,
  ...
}:
let
  cfg = config.programs.namida;
  helpers = import ./helpers.nix { inherit lib jq; };
in
{
  options.programs.namida = with lib; {
    enable = mkEnableOption "Namida";

    package = mkOption {
      type = types.package;
      default = pkgs.callPackage ../default.nix {
        inherit (cfg) icon;
      };

      description = "Namida package to use";
    };

    icon = mkOption {
      type = types.enum [
        "tired"
        "spooky"
        "space"
        "shade"
        "original"
        "namiween"
        "namichin"
        "hollow"
        "glowy"
        "enhanced"
        "eddy"
        "cutsie"
        "default"
      ];

      default = "default";
      description = "Icon to use";
    };

    settingsRaw = mkOption {
      default = {
        enable = false;
        merge = true;
        config = { };
      };

      type = types.submodule {
        options = {
          enable = mkEnableOption "json values in the config directly rather than in programs.namida.settings";
          merge = mkEnableOption "merging rawSettings with programs.namida.settings";
          config = mkOption {
            type = types.attrset;
          };
        };
      };
    };

    settings = mkOption {
      default.enable = false;

      type = types.submodule {
        options = {
          enable = mkEnableOption "Namida configuration through home manager";
          appearance = import ./appearance.nix { inherit types mkOption; };
          playback = import ./playback.nix { inherit types mkOption mkEnableOption; };
          indexer = import ./indexer.nix { inherit types mkOption config; };
          customization = import ./customization.nix { inherit types mkOption; };
          language = import ./language.nix { inherit types mkOption osConfig; };
          backup = import ./backup.nix { inherit config types mkOption; };
          cacheSizes = import ./cacheSizes.nix { inherit types mkOption; };
          player = import ./player.nix { inherit types mkOption; };
        };
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ cfg.package ];
      activation.namidaPatchConf = lib.mkIf cfg.settings.enable (
        home-manager.lib.hm.dag.entryAfter
          [
            "writeBoundary"
          ]
          ''
            mkdir -p ${config.home.homeDirectory}/.namida
            ${helpers.settingsWriteScript "${config.home.homeDirectory}/.namida/namida_settings.json" (
              import ./jsonText.nix { inherit cfg lib; }
            )}

            ${helpers.settingsWriteScript "${config.home.homeDirectory}/.namida/namida_settings_extra.json" (
              import ./jsonTextExtras.nix { inherit cfg lib; }
            )}
          ''
      );
    };
  };
}
