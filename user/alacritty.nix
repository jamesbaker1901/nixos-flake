{ config, pkgs, ... }:
{
  xdg.configFile."alacritty/catppuccin".source = ./alacritty/catppuccin;
  programs.alacritty = {
    enable = true;
    settings = {
      scrolling = { history = 10000; };
      env.TERM = "xterm-256color";
      import = [ "~/.config/alacritty/catppuccin/catppuccin-mocha.yml" ];
      window = {
        dimensions = {
          columns = 0;
          lines = 0;
        };
        padding.x = 0;
        padding.y = 0;
        dynamic_padding = true;
        dynamic_title = true;
        startup_mode = "Windowed";
        opacity = 1.0;
      };
      font = {
        normal = {
          family = "BlexMono Nerd Font Mono";
          sytle = "Bold";
        };
        size = 14.0;
      };
      draw_bold_text_with_bright_colors = true;

      cursor = {
        style = "Block";
        unfocused_hollow = true;
      };
      live_config_reload = true;
    };
  };
}
