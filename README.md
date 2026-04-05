<div align=center>

# Namida player for Nix/Home Manager

[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](/iWisp360/namida-nix/issues)

This flake brings you a native derivation for Namida, as well as a home manager
module for configuration if you want to.

</div>

## Installation

> [!NOTE]
> These steps assume you already set up home manager with flakes and you are
> ready to import modules to your `home.nix`, if you already didn't do so,
> checkout
> [these docs](https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes)
>
> Feel free to skip steps you have already done before

1. Enable unfree nixpkgs

   ```nix
   # configuration.nix
   nixpkgs.config.allowUnfree = true;
   ```

2. Add to your flake inputs

   ```nix
   # flake.nix
   inputs = {
       namida.url = "git+https://codeberg.org/iWisp360/namida-nix";
   };
   ```

3. Import the home manager module

   ```nix
   # home.nix
   imports = [
       inputs.namida.homeManagerModules.namida
   ];
   ```

4. Enable namida

   ```nix
   # home.nix
   programs = {
       namida.enable = true;
   };
   ```

> [!NOTE]
> A package is also offered, if you want just the package, you may want to add
> to your home.packages or environment.systemPackages the package
> `inputs.namida.packages.${system}.default`, or if you aren't using flakes at
> all, you can add this to your packages
>
> ```nix
> (pkgs.callPackage (builtins.fetchGit { 
>   url = "https://codeberg.org/iWisp360/namida-nix"; 
>   rev = "7d5825eab1ad44bb27951b1e7f97522ef7953c19"; # latest revision where nix/default.nix got modified
>  }) { })
> ```

## Configuration

For further configuration, see [docs.md](docs.md) to know the available options
for this module.

Here is an example on how you would configure namida through home manager:

```nix
programs.namida = {
    enable = true;
    settings = {
        enable = true;
        appearance.pitchBlack = true;
        customization.blur = true;
    };
};
```

## Credits

- [iWisp360 - Me](https://codeberg.org/iWisp360)
- [MSOB7Y - Namida's dev](https://github.com/MSOB7YY)

All the credits for Namida goes to original author.

> [!IMPORTANT]
> Although this flake is licensed under the terms of the
> [GPL-3.0-only](./LICENSE.md), Namida isn't, see
> [Namida's license](https://github.com/namidaco/namida/blob/main/LICENSE) to
> know more.
