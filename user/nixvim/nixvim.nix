{ config, pkgs, inputs, ... }: {
  imports = [
    ./which-key.nix
    ./options.nix
    ./keymaps.nix
    ./lsp.nix
    ./nvim-tree.nix
    ./nvim-cmp.nix
    ./lualine.nix
    ./startify.nix
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    globals.mapleader = ",";

    plugins.fugitive.enable = true;
    # plugins.gitgutter.enable = true;
    plugins.gitsigns.enable = true;
    plugins.telescope.enable = true;
    plugins.luasnip = { enable = true; };
    plugins.bufferline.enable = true;
    plugins.comment-nvim.enable = true;
    plugins.indent-blankline = {
      enable = true;
      exclude.filetypes = [ "startify" ];
    };
    plugins.nvim-lightbulb.enable = true;
    plugins.floaterm.enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      { plugin = nvim-web-devicons; } 
      { plugin = autoclose-nvim; }
      (pkgs.vimUtils.buildVimPlugin {
      name = "quick-scope";
      src = pkgs.fetchFromGitHub {
          owner = "unblevable";
          repo = "quick-scope";
          rev = "256d81e391a22eeb53791ff62ce65f870418fa71";
          hash = "sha256-TcA4jZIdnQd06V+JrXGiCMr0Yhm9gB6OMiTSdzMt/Qw";
        };
    })
      ];
    
    extraConfigLua = ''
      require("autoclose").setup()
      require('Comment').setup {
        toggler = {
          ---Line-comment toggle keymap
          line = ',/',
          ---Block-comment toggle keymap
          block = ',/b',
        },
      }

    '';
  };
}
