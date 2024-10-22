<h1> 🌿 MintWalls </h1>

Personal wallpaper & color scheme flake.

> [!CAUTION]
> Highly idiotic and experimental, beware!
>
> While it works for my own flake, I haven't and will not test it for others!

## 🖼️ Wallpapers

If you just want the wallpapers without all this nix bs, just click on the links to download them

| Wallpaper    | Link |
| ------------ | ---- |
| Abstract     | [Unknown](https://i.imgur.com/Q8ZTZCH.png) |
| BetterSonoma | [Basic Apple Guy](https://static1.squarespace.com/static/5e949a92e17d55230cd1d44f/t/65ca8d7e72b2b13769ced989/1707773333181/BSonoma_Mac.png) |
| Black        | [Jean-Marc Denis](https://jmd.im/black) |
| Flow         | [Basic Apple Guy](https://basicappleguy.com/haberdashery/flow) |
| Soda         | [tychoregter](https://www.reddit.com/r/mac/comments/1fbkye2/i_made_a_set_of_wallpapers_for_mac_and_iphone/) |

## 🛠️ Usage

### Flake setup

Just add it as a input to you flake

```nix
{
  # ...
    inputs.mintwalls.url = "github:HeartBlin/MintWalls";
  # rest of flake
}
```

And add the home manager module (or just use the packages directly)

```nix
# Somewhere in home-manager config

{ inputs, ... }:

{
  imports = [ inputs.mintwall.homeManagerModules.mintWalls ];
}
```

### Home Manager module usage

Chosing the wallpaper gives you its palette and package

```nix
{ config, ... }:

{
  mintWalls.wallpaper = "Abstract";
  # mintWalls.wallpaperPkg will get changed to point to the correct package
  # mintWalls.palette will also change to give the correct colors

  # Usage with swww & hyprland
  wayland.windowManager.hyprland.settings.exec-once = [
    "swww img ${config.mintWalls.wallpaperPkg}"
  ];
}
```

## 🎨 Palettes

They are generated with matugen, with this command: ```matugen image <image-path> --show-colors```

The palette.nix file can be generate using the script from the ```tools``` folder. Simply pass a path to a image to the script and it will give you the file

## 📜 License

This repo follows the [EUPL v1.2](https://opensource.org/licenses/MIT). The license refers to the code, not any assets.

Contact: ```heartblin@gmail.com```
