{
  mkOption,
  types,
}:
let
  availableLanguages = import ./availableLanguages.nix;
in
mkOption {
  type = types.enum (builtins.attrNames availableLanguages);
  description = "Language used by Namida";
}
