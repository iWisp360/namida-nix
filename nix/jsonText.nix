{
  cfg,
  lib,
  jq,
}:
let
  baseConfiguration =
    with cfg.settings;
    import ./jsonAttrset.nix {
      inherit
        lib
        jq
        appearance
        customization
        indexer
        language
        backup
        cacheSizes
        player
        misc
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
