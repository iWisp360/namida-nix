{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    wpewebkit.url = "github:iWisp360/wpewebkit";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        inherit (nixpkgs) lib;

        icons = import ./nix/icons.nix;

        mkIconPkgs =
          variant:
          let
            pkgSet = lib.genAttrs icons (icon: pkgs.callPackage ./${variant}.nix { inherit icon; });
          in
          lib.mapAttrs' (name: value: {
            name = "${variant}-${name}";
            inherit value;
          }) pkgSet;

        mkIconYtPkgs =
          variant:
          let
            pkgSet = lib.genAttrs icons (
              icon:
              pkgs.callPackage ./${variant}.nix {
                inherit icon wpewebkit;
                ytLoginSupport = true;
              }
            );
          in
          lib.mapAttrs' (name: value: {
            name = "${variant}-yt-${name}";
            inherit value;
          }) pkgSet;

        wpewebkit = inputs.wpewebkit.packages.${pkgs.stdenv.hostPlatform.system}.default;
      in
      {
        packages = {
          default = pkgs.callPackage ./default.nix { };
          beta = pkgs.callPackage ./beta.nix { };
          default-yt = pkgs.callPackage ./default.nix {
            ytLoginSupport = true;
            inherit wpewebkit;
          };

          beta-yt = pkgs.callPackage ./beta.nix {
            ytLoginSupport = true;
            inherit wpewebkit;
          };
        }
        // (mkIconPkgs "beta")
        // (mkIconPkgs "default")
        // (mkIconYtPkgs "beta")
        // (mkIconYtPkgs "default");
      }
    )
    // {
      homeManagerModules.namida =
        {
          config,
          osConfig,
          pkgs,
          ...
        }:
        import ./nix/module.nix {
          inherit
            config
            pkgs
            osConfig
            inputs
            ;

          inherit (nixpkgs) lib;
          inherit (pkgs) jq;
          inherit (inputs) home-manager;
        };
    };

  nixConfig = {
    extra-substituters = [ "https://cache.garnix.io" ];
    extra-trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
  };
}
