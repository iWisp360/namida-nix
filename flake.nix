{
  description = "A Beautiful and Feature-rich Music & Video Player with Youtube Support, Built in Flutter ";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default = pkgs.callPackage ./default.nix { };
    };
}
