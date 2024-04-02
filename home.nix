{ config, pkgs, inputs, ... }:

{
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.username = "jay";
  home.homeDirectory = "/home/jay";
  home.stateVersion = "23.11";

  imports = [
    ./user/alacritty.nix
    ./user/starship.nix
    ./user/direnv.nix
    ./user/zsh.nix
  ];

  home.packages = with pkgs; [
    xclip
    neofetch
    (nerdfonts.override { fonts = [ "DroidSansMono" "IBMPlexMono" ]; })
    slack
    discord
    spotify
    ripgrep
    fzf
    kubectl
    mpv
    youtube-dl
    font-awesome
    lxappearance
    zoom-us
    rustup
    ranger
    rofi-wayland
    calibre
    deluge-gtk
    catppuccin-gtk
    gmtp
    macchina
    pfetch
    grimblast
  ];

  xdg.configFile.hypr.source = ./user/hypr;
  xdg.configFile.waybar.source = ./user/waybar;
  home.file.".tmux.conf".source = ./user/tmux/tmux.conf;

  xdg.configFile."rofi/config.rasi".source = ./user/rofi/config.rasi;
  home.file.".local/share/rofi/themes/catppuccin-mocha.rasi".source =
    ./user/rofi/themes/catppuccin-mocha.rasi;

  home.sessionVariables = { EDITOR = "nvim"; };

}
