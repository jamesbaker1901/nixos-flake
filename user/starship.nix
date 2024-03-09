{ config, pkgs, inputs, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 700;

      format =
        "$directory$git_branch$git_status$aws$line_break$env_var$kubernetes$character";

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
      character = { vicmd_symbol = "[](bold green) "; };
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
}
