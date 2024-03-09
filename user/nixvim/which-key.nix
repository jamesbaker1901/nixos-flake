{ config, pkgs, inputs, ... }: 
{
    programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = which-key-nvim;
        config = ''
	source ./which-key.lua
        '';
      }
    ];
    };
}
