{ cfg, lib }:
let
  baseConfiguration = import ./jsonAttrsetExtras.nix { inherit (cfg.settings) customization; };
in
builtins.toJSON (
  if cfg.settingsRaw.enable && cfg.settingsRaw.merge then
    lib.recursiveUpdate baseConfiguration (cfg.settingsRaw.config or { })
  else if cfg.settingsRaw.enable then
    (cfg.settingsRaw.config or { })
  else
    baseConfiguration
)
