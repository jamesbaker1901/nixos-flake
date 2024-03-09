{ config, pkgs, inputs, ... }: 
{
    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = which-key-nvim;
      }
    ];
}
