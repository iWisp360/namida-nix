{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
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
      in
      {
        packages = {
          default = pkgs.callPackage ./default.nix { };
          beta = pkgs.callPackage ./beta.nix { };
        }
        // (mkIconPkgs "beta")
        // (mkIconPkgs "default");
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
    extra-substituters = [ "https://namida-nix.cachix.org" ];
    extra-trusted-public-keys = [
      "namida-nix.cachix.org-1:0XnwdSaWlrvwOzckblOlUTqn67K9IXFVces5WFplANQ="
    ];
  };
}
