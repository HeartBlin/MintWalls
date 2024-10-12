{ moduleWithSystem, ... }: {
  flake.homeManagerModules.mintWalls =
    moduleWithSystem (perSystem@{ config }: import ../wallpapers perSystem);
}
