{ moduleWithSystem, ... }:

{
  flake.homeManagerModules.mintWalls = moduleWithSystem (perSystem@{ config }:
    { config, lib, ... }:
    let
      inherit (lib) mkOption;
      inherit (lib.types) attrsOf enum path str;
    in {
      options.mintWalls = {
        wallpaper = mkOption {
          type = enum [ "Abstract" "BetterSonoma" "Black" "Flow" "Soda" ];
          default = "Abstract";
          description = "The wallpaper to use";
        };

        wallpaperPkg = mkOption {
          type = path;
          description = "The wallpaper package to use";
          default = perSystem.config.packages.${config.mintWalls.wallpaper};
          readOnly = true;
        };

        palette = mkOption {
          type = attrsOf str;
          default =
            import ../wallpapers/${config.mintWalls.wallpaper}/palette.nix;
          readOnly = true;
        };

        defaultPalette = mkOption {
          type = attrsOf str;
          readOnly = true;
          default = {
            borderBlue = "089AFF";
            borderViolet = "C26EFC";
            borderRed = "FA5B59";
            borderOrange = "FEA509";
          };
        };
      };
    });
}
