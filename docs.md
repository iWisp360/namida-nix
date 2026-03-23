> [!NOTE]
> TODO, check ./nix/module.nix meanwhile

> [!NOTE]
> Namida is in constant development, and to align with it, I provided the option
> `programs.namida.useBetaPackage`, which, when set to true, will bring the very
> latest snapshot version, instead of `5.7.2-beta`.

> [!WARNING]
> All beta packages are marked as broken!

# Namida Configuration with Nix

This module uses JQ to safely merge all options defined within this module,
while other settings remain untouched. If an option is not provided, you may
define it directly by knowing the json key at `programs.namida.settingsRaw`,
note that `enable` must be set to true for it to work

Namida supports more than just its default icon(at least the home manager
module). If you want, you can set `programs.namida.icon` to one of

```nix
[
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
]
```

> [!NOTE]
> If you want to preview the icons, check out
> [https://codeberg.org/iWisp360/namida-icons]
>
> By default, `programs.namida.icon` is set to "default"

> [!NOTE]
> At this point, this documentation page assumes `cfg` is
> `programs.namida.settings`

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

## Other

> [!TODO]

### Player

> [!TODO]

### Language

> [!TODO]

### cacheSizes

> [!TODO]

### Backup

> [!TODO]

## Experimentals

> [!TODO]
