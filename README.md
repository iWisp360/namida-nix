# Namida player for Nix/Home Manager

This flake brings you a native derivation for Namida, as well as a home manager
module for configuration if you want to.

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

2. Add Garnix to your substituters

   > [!NOTE]
   > Namida depends on wpewebkit, which is a WebKit port, and it's a resource
   > hog when being compiled, requiring a good CPU and lots of RAM for
   > compiling, so I recommend setting up Garnix

   ```nix
   # configuration.nix
   nix = {
       substituters = [
           "https://cache.garnix.io"
       ];

       trusted-public-keys = [
           "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
       ];
   };
   ```

   > [!NOTE]
   > See [https://garnix.io/docs/ci/caching]

3. Add to your flake inputs

   ```nix
   # flake.nix
   inputs = {
       namida.url = "git+https://codeberg.org/iWisp360/namida-nix";
   };
   ```

4. Import the home manager module

   ```nix
   # home.nix
   imports = [
       inputs.namida.homeManagerModules.namida
   ];
   ```

5. Enable namida

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
>   rev = "85ecceaff6bfa6c0409dff05ceee8d0b21adaaf0"; # latest revision where nix/default.nix got modified
>  }))
> ```

## Configuration

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
> Although this flake is licensed under the terms of the
> [GPL-3.0-only](./LICENSE.md), Namida isn't, see
> [Namida's license](https://github.com/namidaco/namida/blob/main/LICENSE) to
> know more.
