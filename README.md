# Namida player for Nix/Home Manager

This flake brings you a native derivation for Namida, as well as a home manager
module for configuration if you want to.

## Installation

1. Add to your flake inputs

   ```nix
   # flake.nix
   inputs = {
       namida = {
           url = "git+https://codeberg.org/iWisp360/namida-nix";
           inputs.nixpkgs.follows = "nixpkgs";
       };
   };
   ```

2. Import the home manager module

   ```nix
   # home.nix
   imports = [
       inputs.namida.homeManagerModules.namida
   ];
   ```

3. Enable namida

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
> (import (builtins.fetchGit { 
>   url = "https://codeberg.org/iWisp360/namida-nix"; 
>   rev = "90dc7805bc2d0e7b456983985698a6676ca36b35"; # latest revision where nix/default.nix got modified
>  }))
> ```

## Configuration

> [!WARNING]
> Don't configure namida through this flake yet! It is still WIP, and some
> settings needs to be moved away from the namida settings file, I already asked
> the dev to do so.

To configure namida with the home manager module, follow these steps:

1. Set programs.namida.settings.enable to true

   ```nix
   programs = {
       namida = {
           enable = true;
           settings = {
               enable = true;
               # ...
           };
       };
   };
   ```

   > [!NOTE]
   > See [docs.md](docs.md) to know the available options for
   > programs.namida.settings

## Credits

- [iWisp360 - Me](https://codeberg.org/iWisp360)
- [MSOB7Y - Namida's dev](https://github.com/MSOB7YY)

All the credits for Namida goes to original author.

> [!IMPORTANT]
> Although this flake is licensed under the terms of the GPL, Namida isn't, see
> [Namida's license](https://github.com/namidaco/namida/blob/main/LICENSE) to
> know more.
