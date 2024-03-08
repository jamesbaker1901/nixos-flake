{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.username = "jay";
  home.homeDirectory = "/home/jay";
  home.stateVersion = "23.11";

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
  ];

  xdg.configFile."hypr/hyprland.conf".source = ./user/hypr/hyprland.conf;

  #home.file = {
  #};

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      ls = "exa";
      ll = "exa -bghl";
      la = "exa -bghla";
      lt = "exa -T";
      cat = "bat";
      update = "sudo nixos-rebuild switch --flake /etc/nixos#default";
   };
  };

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;
  programs.zoxide.enableBashIntegration = true;

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

    programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 700;

      format = "$directory$git_branch$git_status$aws$line_break$env_var$kubernetes$character";

      directory = {
        format = "[$path]($style)[$read_only]($read_only_style) ";
        truncate_to_repo = true;
        truncation_length = 8;
      };
      git_branch = {
        format = "[$symbol$branch]($style) ";
        symbol = "";
        style = "purple";
      };
      character = {
        vicmd_symbol = "[](bold green) ";
      };
      aws.region_aliases = {
        us-east-1 = "use1";
        us-west-2 = "usw2";
        eu-west-2 = "euw2";
      };
      env_var = {
        variable = "VENV";
        format = "[$env_value]($style) ";
      };
      kubernetes = {
        symbol = "󰠳";
        style = "green";
        disabled = false;
        format = "[$symbol $context $namespace]($style) ";
      };

    };
  };
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
    set -g @catppuccin_window_left_separator ""
    set -g @catppuccin_window_right_separator " "
    set -g @catppuccin_window_middle_separator " █"
    set -g @catppuccin_window_number_position "right"
    set -g @catppuccin_window_default_fill "number"
    set -g @catppuccin_window_default_text "#W"
    set -g @catppuccin_window_current_fill "number"
    set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
    set -g @catppuccin_status_modules_right "directory date_time"
    set -g @catppuccin_status_modules_left "session"
    set -g @catppuccin_status_left_separator  " "
    set -g @catppuccin_status_right_separator " "
    set -g @catppuccin_status_right_separator_inverse "no"
    set -g @catppuccin_status_fill "icon"
    set -g @catppuccin_status_connect_separator "no"
    set -g @catppuccin_directory_text "#{b:pane_current_path}"
    set -g @catppuccin_date_time_text "%H:%M"
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
      {
        plugin = tmuxPlugins.catppuccin;
      }
      {
        plugin = tmuxPlugins.tmux-fzf;
      }
    ];
  };

}
