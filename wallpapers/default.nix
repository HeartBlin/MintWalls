perSystem:
{ config, lib, ... }:
let
  inherit (lib) mkOption;
  inherit (lib.types) attrsOf enum path str;
in {
  options.mintWalls = {
    wallpaper = mkOption {
      type = enum [ "Abstract" "BetterSonoma" "Soda" ];
      default = "Abstract";
      description = "The wallpaper to use";
    };

    wallpaperPkg = mkOption {
      type = path;
      description = "The wallpaper package to use";
    };

    palette = mkOption { type = attrsOf str; };
    defaultPallete = mkOption { type = attrsOf str; };
  };

  config.mintWalls = {
    wallpaperPkg = perSystem.config.packages.${config.mintWalls.wallpaper};
    palette = import ./${config.mintWalls.wallpaper}/palette.nix;

    # This never changes
    # Used mostly for my system flake
    defaultPalette = {
      borderBlue = "089AFF";
      borderViolet = "C26EFC";
      borderRed = "FA5B59";
      borderOrange = "FEA509";
    };
  };
}
