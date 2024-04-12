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
    slack
    discord
    spotify
    zoom-us
    ripgrep
    fzf
    mpv
    vlc
    youtube-dl
    deluge-gtk
    font-awesome
    (nerdfonts.override { fonts = [ "DroidSansMono" "IBMPlexMono" ]; })
    ranger
    rofi-wayland
    catppuccin-gtk
    gmtp
    xclip
    neofetch
    pfetch
    grimblast
    kraft 
    rustup
    kubectl
    stern
    jq
    yq
  ];

  home.file.".tmux.conf".source = ./user/tmux/tmux.conf;

  home.sessionVariables = { EDITOR = "nvim"; };
}
