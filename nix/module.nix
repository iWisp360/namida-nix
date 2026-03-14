{
  config,
  lib,
  home-manager,
  pkgs,
  jq,
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
      default = pkgs.callPackage ../default.nix { };
      description = "Namida package to use";
    };

    settingsRaw = mkOption {
      default = {
        enable = false;
        merge = true;
        config = { };
      };

      type = types.submodule {
        options = {
          enable = mkEnableOption "Whether to set json values in the config directly rather than in programs.namida.settings";
          merge = mkEnableOption "Whether to merge settings set here with the ones at programs.namida.settings";
          config = mkOption {
            type = types.attrset;
          };
        };
      };
    };

    settings = mkOption {
      default = import ./default.nix { inherit config; };

      type = types.submodule {
        # config = import ./config.nix { inherit cfg; };
        options = {
          enable = mkEnableOption "Whether to configure Namida through home manager";
          appearance = import ./appearance.nix { inherit types mkOption mkEnableOption; };
          playback = import ./playback.nix { inherit types mkOption mkEnableOption; };
          indexer = import ./indexer.nix { inherit types mkOption mkEnableOption; };
          customization = import ./customization.nix { inherit types mkOption mkEnableOption; };
          language = import ./language.nix { inherit types mkOption; };
        };
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ cfg.package ];
      activation.namidaPatchConf = home-manager.lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        cat ${import ./jsonText.nix { inherit cfg lib; }} > settings.json
        ${jq}/bin/jq -s ".[0] * .[1]" ${config.home.homeDirectory}/.namida/namida_settings.json settings.json > new_settings.json
        cat new_settings.json
        exit 1
      '';
    };
  };
}
