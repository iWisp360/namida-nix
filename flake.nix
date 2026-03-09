{
  inputs.nixpkgs.url = "nixpkgs/nixos-25.11";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      homeManagerModules.namida =
        { config, ... }:
        import ./module.nix {
          inherit config;
          inherit (nixpkgs) lib;
          inherit pkgs;
        };

      packages.${system}.default = pkgs.callPackage ./default.nix { };
    };
}
