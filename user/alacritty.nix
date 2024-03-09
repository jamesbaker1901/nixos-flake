{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      scrolling = {
        history = 10000;
      };
    env.TERM = "xterm-256color";
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
    colors = {
      primary = {
        background = "0x1e2127";
        foreground = "0xabb2bf";
      };
      normal = {
        black = "0x1e2127";
        red = "0xe06c75";
        green = "0x98c379";
        yellow = "0xd19a66";
        blue = "0x61afef";
        magenta = "0xc678dd";
        cyan = "0x56b6c2";
        white = "0xabb2bf";
      };
      bright = {
        black = "0x5c6370";
        red = "0xe06c75";
        green = "0x98c379";
        yellow = "0xd19a66";
        blue = "0x61afef";
        magenta = "0xc678dd";
        cyan = "0x56b6c2";
        white = "0xffffff";
      };
      cursor = {
        background = "0xf0f0f0";
        foreground = "0x26282a";
      };
      dim = {
        black = "0x31363b";
        red = "0x783228";
        green = "0x17a262";
        yellow = "0xb65619";
        blue = "0x1b668f";
        magenta = "0x614a73";
        cyan = "0x186c60";
        white = "0x63686d";
      };
    };

    cursor = {
      style = "Block";
      unfocused_hollow = true;
    };
    live_config_reload = true;
    };
  };
}
