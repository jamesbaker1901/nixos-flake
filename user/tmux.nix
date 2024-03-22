{ config, pkgs, inputs, ... }: {
  programs.tmux = {
    enable = true;
    mouse = true;

    baseIndex = 1;
    extraConfig = ''
      set -g renumber-windows on    # renumber windows when a window is closed
      setw -g pane-base-index 1     # make pane numbering consistent with windows
      set -g set-titles on          # set terminal title

      set -g display-panes-time 800 # slightly longer pane indicators display time
      set -g display-time 1000      # slightly longer status messages display time

      set -g status-interval 1     # redraw status line every 10 seconds
      set -q -g status-utf8 on                  # expect UTF-8 (tmux < 2.2)
      set -g status-position top   # place the bar at top of screen
      set -g status-justify left

      set -g history-limit 5000                 # boost history
      setw -q -g utf8 on
      set -g default-terminal "screen-256color" # colors!
      setw -g xterm-keys on
      set -s escape-time 10                     # faster command sequences
      set -sg repeat-time 600                   # increase repeat timeout
      set -s focus-events on

      set -g monitor-activity on
      set -g visual-activity off
      bind C-c new-session

      set -g prefix2 C-a                        # GNU-Screen compatible prefix
      bind C-a send-prefix -2

      # find session
      bind C-f command-prompt -p find-session 'switch-client -t %%'

      # split current window horizontally
      bind - split-window -v
      # split current window vertically
      bind _ split-window -h

      # pane navigation
      bind -r h select-pane -L  # move left
      bind -r j select-pane -D  # move down
      bind -r k select-pane -U  # move up
      bind -r l select-pane -R  # move right
      bind > swap-pane -D       # swap current pane with the next one
      bind < swap-pane -U       # swap current pane with the previous one

      # window navigation
      unbind n
      unbind p
      bind -r C-h previous-window # select previous window
      bind -r C-l next-window     # select next window
      bind Tab last-window        # move to last active window

      # catppuccin
      set -g @catppuccin_flavour 'mocha' 
      set -g @catppuccin_window_left_separator ""
      set -g @catppuccin_window_right_separator " "
      set -g @catppuccin_window_middle_separator " █"
      set -g @catppuccin_window_number_position "right"

      set -g @catppuccin_window_default_fill "number"
      set -g @catppuccin_window_default_text "#W"

      set -g @catppuccin_window_current_fill "number"
      set -g @catppuccin_window_current_text "#W"

      set -g @catppuccin_status_modules_right "directory session"
      set -g @catppuccin_status_left_separator  " "
      set -g @catppuccin_status_right_separator ""
      set -g @catppuccin_status_right_separator_inverse "no"
      set -g @catppuccin_status_fill "icon"
      set -g @catppuccin_status_connect_separator "no"

      set -g @catppuccin_directory_text "#{pane_current_path}"

    '';

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
      { plugin = tmuxPlugins.catppuccin; }
      { plugin = tmuxPlugins.tmux-fzf; }
    ];
  };

}
