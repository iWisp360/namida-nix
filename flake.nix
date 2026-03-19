{
  inputs = {
    nixpkgs.url = "github:iWisp360/nixpkgs";
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
      };
    };
}
