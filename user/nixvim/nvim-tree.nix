{ config, pkgs, inputs, ... }: 
{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
      disableNetrw = true;
      hijackNetrw = true;
      autoReloadOnWrite = true;
      hijackCursor = true;
    };
  };
}
