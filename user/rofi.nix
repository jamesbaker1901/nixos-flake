{ config, pkgs, inputs, ... }: {
  xdg.configFile."rofi/config.rasi".source = ./rofi/config.rasi;
  home.file.".local/share/rofi/themes/catppuccin-mocha.rasi".source =
    ./rofi/themes/catppuccin-mocha.rasi;
}
