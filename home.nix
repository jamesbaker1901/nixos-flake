{ config, pkgs, inputs, ... }: {
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
    ./user/git.nix
    ./user/hypr.nix
    ./user/rofi.nix
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
    kraft
  ];

  home.file.".tmux.conf".source = ./user/tmux/tmux.conf;

  home.sessionVariables = { EDITOR = "nvim"; };
}
