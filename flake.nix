{
  description = "Personal flake for wallpapers";

  outputs = inputs@{ flake-parts, systems, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;

      imports = [
        ./parts/checks.nix
        ./parts/devShell.nix
        ./parts/module.nix
        ./parts/overlay.nix
        ./parts/packages.nix
      ];
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    pkgs-by-name.url = "github:drupol/pkgs-by-name-for-flake-parts";

    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    pre-commit-hooks.inputs = {
      nixpkgs.follows = "nixpkgs";
      nixpkgs-stable.follows = "nixpkgs";
    };

    systems.url = "github:nix-systems/default";
  };
}
