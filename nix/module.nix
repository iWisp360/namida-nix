{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.namida;
in
{
  options.programs.namida = with lib; {
    enable = mkEnableOption "Whether to enable namida";
    package = mkOption {
      type = types.package;
      default = pkgs.callPackage ./default.nix { };
      description = "Namida package to use";
    };

    settingsRaw = mkOption {
      type = types.submodule {
        options = {
          enable = mkEnableOption "Whether to set json values in the config directly rather than in programs.namida.settings";
          merge = mkEnableOption "Whether to merge settings set here with the ones at programs.namida.settings";
          config = mkOption {
            type = types.nullOr types.attrset;
            default = null;
          };
        };
      };
    };

    settings = mkOption {
      default = {
        enable = false;
        # ... TODO
      };

      type = types.submodule {
        config = import ./config.nix;

        options = {
          enable = mkEnableOption "Whether to configure Namida through home manager";
          appearance = import ./appearance.nix;
          playback = import ./playback.nix;
          indexer = import ./indexer.nix;
          language = import ./language.nix;
        };
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ cfg.package ];
      file.".namida/namida_settings.json" = lib.mkIf cfg.settings.enable {
        text = import ./jsonText.nix;
      };
    };
  };
}
