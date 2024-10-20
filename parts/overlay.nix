{ inputs, ... }:

{
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];

  perSystem = { config, ... }: {
    overlayAttrs = builtins.attrValues config.packages;
  };
}
