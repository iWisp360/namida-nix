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
      packages.${system}.default = pkgs.callPackage ./default.nix { };
      homeManagerModules.namida = ./module.nix;
    };
}
