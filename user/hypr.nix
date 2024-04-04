{ config, pkgs, inputs, ... }: {
  home.file.".wallpaper".source = ./hypr/wallpaper.png;
  xdg.configFile.hypr.source = ./hypr;
  xdg.configFile.waybar.source = ./waybar;
}
