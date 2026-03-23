{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    wpewebkit.url = "github:iWisp360/wpewebkit";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
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
      homeManagerModules.namida =
        { config, osConfig, ... }:
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

      packages.${system} = {
        default = pkgs.callPackage ./default.nix { };
        beta = pkgs.callPackage ./beta.nix {
          wpewebkit = inputs.wpewebkit.packages.${pkgs.stdenv.hostPlatform.system}.default;
        };
      }
      // (mkIconPkgs "beta")
      // (mkIconPkgs "default");
    };

  nixConfig = {
    extra-substituters = [ "https://cache.garnix.io" ];
    extra-trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
  };
}
