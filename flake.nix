{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      homeManagerModules.namida =
        { config, osConfig, ... }:
        import ./nix/module.nix {
          inherit config pkgs osConfig;
          inherit (nixpkgs) lib;
          inherit (pkgs) jq;
          inherit (inputs) home-manager;
        };

      packages.${system} = {
        default = pkgs.callPackage ./default.nix { };
        beta = pkgs.callPackage ./beta.nix { };

        beta-tired = pkgs.callPackage ./beta.nix { icon = "tired"; };
        beta-spooky = pkgs.callPackage ./beta.nix { icon = "spooky"; };
        beta-space = pkgs.callPackage ./beta.nix { icon = "space"; };
        beta-shade = pkgs.callPackage ./beta.nix { icon = "shade"; };
        beta-original = pkgs.callPackage ./beta.nix { icon = "original"; };
        beta-namiween = pkgs.callPackage ./beta.nix { icon = "namiween"; };
        beta-namichin = pkgs.callPackage ./beta.nix { icon = "namichin"; };
        beta-hollow = pkgs.callPackage ./beta.nix { icon = "hollow"; };
        beta-glowy = pkgs.callPackage ./beta.nix { icon = "glowy"; };
        beta-enhanced = pkgs.callPackage ./beta.nix { icon = "enhanced"; };
        beta-eddy = pkgs.callPackage ./beta.nix { icon = "eddy"; };
        beta-cutsie = pkgs.callPackage ./beta.nix { icon = "cutsie"; };

        default-tired = pkgs.callPackage ./beta.nix { icon = "tired"; };
        default-spooky = pkgs.callPackage ./beta.nix { icon = "spooky"; };
        default-space = pkgs.callPackage ./beta.nix { icon = "space"; };
        default-shade = pkgs.callPackage ./beta.nix { icon = "shade"; };
        default-original = pkgs.callPackage ./beta.nix { icon = "original"; };
        default-namiween = pkgs.callPackage ./beta.nix { icon = "namiween"; };
        default-namichin = pkgs.callPackage ./beta.nix { icon = "namichin"; };
        default-hollow = pkgs.callPackage ./beta.nix { icon = "hollow"; };
        default-glowy = pkgs.callPackage ./beta.nix { icon = "glowy"; };
        default-enhanced = pkgs.callPackage ./beta.nix { icon = "enhanced"; };
        default-eddy = pkgs.callPackage ./beta.nix { icon = "eddy"; };
        default-cutsie = pkgs.callPackage ./beta.nix { icon = "cutsie"; };
      };
    };

  nixConfig = {
    extra-substituters = [ "https://cache.garnix.io" ];
    extra-trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
  };
}
