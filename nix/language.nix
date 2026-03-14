{
  mkOption,
  types,
  osConfig,
}:
let
  availableLanguages = import ./availableLanguages.nix;
in
mkOption {
  default = osConfig.i18n.defaultLocale or "en_US.UTF-8";
  type = types.enum (builtins.attrNames availableLanguages);
  description = "Language used by Namida";
}
