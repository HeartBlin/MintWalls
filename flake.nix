{
  description = "Personal flake for wallpapers";

  outputs = inputs@{ flake-parts, systems, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;

      imports = [ inputs.pkgs-by-name-for-flake-parts.flakeModule ];

      perSystem = _: { pkgsDirectory = ./wallpapers; };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    pkgs-by-name-for-flake-parts.url =
      "github:drupol/pkgs-by-name-for-flake-parts";

    systems.url = "github:nix-systems/default";
  };
}
