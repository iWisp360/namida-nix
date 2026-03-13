{ cfg, lib }:
let
  baseConfiguration =
    with cfg.settings;
    import ./jsonAttrset.nix {
      inherit
        hexToInt32Argb
        lib
        appearance
        customization
        indexer
        language
        ;
    };
in
builtins.toJSON (
  if cfg.settingsRaw.enable && cfg.settingsRaw.merge then
    lib.recursiveUpdate baseConfiguration (cfg.settingsRaw.config or { })
  else if cfg.settingsRaw.enable then
    (cfg.settingsRaw.config or { })
  else
    baseConfiguration
)
