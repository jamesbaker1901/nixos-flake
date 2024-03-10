{ config, pkgs, inputs, ... }: {
  imports = [
    ./which-key.nix
    ./options.nix
    ./keymaps.nix
    ./lsp.nix
    ./nvim-tree.nix
    ./nvim-cmp.nix
    ./lualine.nix
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    globals.mapleader = ",";

    plugins.startify = { enable = true; };
    plugins.fugitive.enable = true;
    plugins.gitgutter.enable = true;
    plugins.telescope.enable = true;
    plugins.luasnip = { enable = true; };
    plugins.bufferline.enable = true;
    plugins.indent-blankline.enable = true;
    extraPlugins = with pkgs.vimPlugins; [{ plugin = nvim-web-devicons; }];
  };
}
