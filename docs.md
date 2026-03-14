> [!NOTE]
> TODO, check ./nix/module.nix meanwhile

## Progress

- [x] Theme section
- [x] Indexer section
- [/] Playback section
- [x] Customizations section
- [ ] Youtube section
- [ ] Extras section
- [ ] Backup & Restore section
- [ ] Advanced Section

# Namida Configuration with Nix

This module uses JQ to safely merge all options defined within this module,
while other settings remain untouched. If an option is not available yet, you
may define it directly by knowing the json key at `programs.namida.settingsRaw`,
note that `enable` must be set to true for it to work

This documentation page assumes `cfg` is `programs.namida.settings`

## Appearance

### cfg.appearance

Appearance related configurations for the player, like theming and so.

### cfg.appearance.mode

Can take three values: "dark", "light", "system"

Type: str

Default: `"system"`

### cfg.appearance.forceMiniPlayerFollowTrackColors

Whether miniplayer should take track's artwork colors

Type: bool

Default: `false`

### cfg.appearance.pitchBlack

Whether to set pitch black background

Type: bool

Default: `false`

### cfg.appearance.autoColor

Whether to automatically pick player colors from music's artwork

Type: bool

Default: `true`

### cfg.appearance.animatedTheme

Whether to animate theme, not sure about this one :V

Type: bool

Default: `true`

### cfg.appearance.staticColors

The values set here are ignored if `cfg.appearance.autoColor` is set to `true`

### cfg.appearance.staticColors.dark and cfg.appearance.staticColors.light

Takes a Hexadecimal Hash color, in RGBA format.

Type: str

Default: light: `"#9c99c1ff"` dark: `"#4e4c72ff"`

## Indexer

> [!TODO]

## Customization

> [!TODO]
