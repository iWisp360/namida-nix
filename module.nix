{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.programs.namida;
in
{
  options.programs.namida = {
    enable = lib.mkEnableOption "Namida";
    package = inputs.namida.packages.${pkgs.stdenv.hostPlatform.system}.default;
    settings = {
      type = lib.types.attrs;
      default = { };
      description = "Namida configuration";
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ cfg.package ];
      file.".namida/namida_settings.json".text = builtins.toJSON cfg.settings;
    };
  };
}
