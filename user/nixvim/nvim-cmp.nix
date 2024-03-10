{ config, pkgs, inputs, ... }: 
{
  programs.nixvim = {
    plugins.nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "luasnip"; }
        { name = "cmdline"; }
      ];

      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<Tab>" = {
          action = "cmp.mapping.select_next_item()";
          modes = [ "i" "s" ];
        };
      };
    };
  };
}
