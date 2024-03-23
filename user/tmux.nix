{ config, pkgs, inputs, ... }: {
  home.file.".tmux.conf".source = ./tmux/tmux.conf;
}
