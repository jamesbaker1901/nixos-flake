{ config, pkgs, inputs, ... }:
{
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

    history = {
      path = "~/.zsh_history";
      size = 10000;
      extended = true;
      ignoreSpace = true;
    };
    enableCompletion = true;
  };

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;
  programs.zoxide.enableBashIntegration = true;


}
