{ config, pkgs, inputs, ... }:

{
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.username = "jay";
  home.homeDirectory = "/home/jay";
  home.stateVersion = "23.11";

  imports = [ ./user/alacritty.nix ./user/starship.nix ./user/tmux.nix ];

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
  ];

  xdg.configFile.hypr.source = ./user/hypr;
  xdg.configFile.waybar.source = ./user/waybar;

  xdg.configFile."rofi/config.rasi".source = ./user/rofi/config.rasi;
  home.file.".local/share/rofi/themes/catppuccin-mocha.rasi".source = ./user/rofi/themes/catppuccin-mocha.rasi;

  home.sessionVariables = { EDITOR = "nvim"; };

  programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      ls = "exa";
      ll = "exa -bghl";
      la = "exa -bghla";
      lt = "exa -T";
      cat = "bat";
      gp = "git push";
      update = "sudo nixos-rebuild switch --flake /etc/nixos#default";
    };
  };

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;
  programs.zoxide.enableBashIntegration = true;
}
