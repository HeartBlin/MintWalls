{
  description = "Personal flake for wallpapers";

  outputs = inputs@{ flake-parts, systems, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;

      imports = [
        inputs.pkgs-by-name-for-flake-parts.flakeModule
        inputs.pre-commit-hooks.flakeModule
      ];

      perSystem = { config, pkgs, ... }: {
        # Packages
        pkgsDirectory = ./wallpapers;

        # Checks
        pre-commit = {
          settings = {
            excludes = [ "flake.lock" ];
            hooks = {
              deadnix = {
                enable = true;
                verbose = true;
                fail_fast = true;
              };

              nixfmt-classic = {
                enable = true;
                verbose = true;
                fail_fast = true;
              };

              statix = {
                enable = true;
                verbose = true;
                fail_fast = true;
              };
            };
          };
        };

        # DevShell
        devShells.default = pkgs.mkShellNoCC {
          name = "Nix";
          buildInputs = config.pre-commit.settings.enabledPackages;
          shellHook = config.pre-commit.installationScript;
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    pkgs-by-name-for-flake-parts.url =
      "github:drupol/pkgs-by-name-for-flake-parts";

    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    pre-commit-hooks.inputs = {
      nixpkgs.follows = "nixpkgs";
      nixpkgs-stable.follows = "nixpkgs";
    };

    systems.url = "github:nix-systems/default";
  };
}
