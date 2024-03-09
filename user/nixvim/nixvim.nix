{ config, pkgs, inputs, ... }: 
{
  imports = [ ./which-key.nix ./options.nix ./keymaps.nix ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    globals.mapleader = ",";


    plugins.startify = {
    enable = true;
    };

    plugins.fugitive.enable = true;
    plugins.gitgutter.enable = true;

    plugins.nvim-tree = {
      enable = true;
      disableNetrw = true;
      hijackNetrw = true;
      autoReloadOnWrite = true;
      hijackCursor = true;
    };

    plugins.lualine = {
      enable = true;
      iconsEnabled = true;
      componentSeparators.left = "";
      componentSeparators.right = "";
      sectionSeparators.left = "";
      sectionSeparators.right = "";
      sections = { lualine_a = [ "mode" ]; };

    };

    plugins.lsp = {
      enable = true;
      servers = {
        tsserver.enable = true;
        lua-ls.enable = true;
        gopls.enable = true;
        bashls.enable = true;
        jsonls.enable = true;
        yamlls.enable = true;
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        rnix-lsp.enable = true;
      };
    };

    plugins.telescope.enable = true;
    plugins.treesitter = {
      enable = true;
      ensureInstalled = [ "rust" "bash" "json" "python" "yaml" "nix" "vim" ];
      nixvimInjections = true;
      indent = true;
    };

    #plugins.which-key = { enable = true; };

    plugins.luasnip = { enable = true; };

    plugins.bufferline.enable = true;

    plugins.indent-blankline.enable = true;


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

    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-web-devicons;
      }
    ];

  };
}
