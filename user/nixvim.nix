{ config, pkgs, inputs, ... }:
{  
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    globals.mapleader = ",";

    options = {
      encoding = "utf-8";
      number = true;
      ttyfast = true;
      mouse = "a";
      laststatus = 2;
      autoread = true;
      autoindent = true;
      backspace = [ "indent" "eol" "start" ];
      incsearch = true;
      hlsearch = true;
      showcmd = true;
      autowrite = true;
      hidden = true;
      fileformats = ["unix" "dos" "mac" ];
      ignorecase = true;
      smartcase = true;
      lazyredraw = true;
      clipboard = "unnamed";
      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      #updatetime = 300; # gitgutter sets this to 100 so it conflicts
      completeopt = "menuone";
      cursorline = true; 
      termguicolors = true;
    };

    extraConfigLua = ''
      vim.cmd "set nocompatible"
      vim.cmd "set t_Co=256"
      vim.cmd "let &t_ut=\'\'"
      vim.cmd "filetype off"
      vim.cmd "filetype plugin indent on"
      vim.cmd "filetype plugin on"
      vim.cmd "set noerrorbells"
      vim.cmd "set noswapfile"
      vim.cmd "set nobackup"
      vim.cmd "set splitright"
      vim.cmd "set splitbelow"
      vim.cmd "set noshowmatch"
      vim.cmd "set noshowmode"
      vim.cmd "set nocursorcolumn"
      vim.cmd "set completeopt+=noinsert"
      vim.cmd "set completeopt-=preview"
      vim.cmd "set shortmess+=c"
      vim.cmd "set nofoldenable"
      vim.cmd "let base16colorspace=256"
      vim.cmd "let g:indent_blankline_enabled = v:false"
      vim.cmd "let g:fugitive_gitlab_domains = ['https://gitlab.ops.ripple.com']"
      vim.api.nvim_command("autocmd InsertEnter * norm zz")
      vim.cmd "hi Normal guibg=NONE ctermbg=NONE"
      vim.cmd "let base16colorspace=256" 
      vim.cmd "set cmdheight=1"
      vim.cmd "set timeoutlen=150"
      vim.cmd "set ttimeoutlen=10"
    '';

    keymaps = [
      {
        action = "<esc>";
        key = ";;";
        mode = "i";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        key = ";";
        action = ":w<CR>";
        mode = "n";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        key = "<leader>q";
        action = ":q<CR>";
        mode = "n";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        key = "<C-j>";
        action = ":bn<CR>";
        mode = "n";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        key = "<C-k>";
        action = ":bp<CR>";
        mode = "n";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        key = "<C-d>";
        action = ":bd<CR>";
        mode = "n";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        key = "<C-n>";
        action = ":NvimTreeToggle<CR>";
        mode = "n";
        options = {
          noremap = true;
          silent = true;
        };
      }
    ];

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
        sections = {
          lualine_a = [ "mode" ];
        };

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
      ensureInstalled = [
        "rust"
        "bash"
        "json"
        "python"
        "yaml"
        "nix"
        "vim"
      ];
      nixvimInjections = true;
      indent = true;
    };

    plugins.which-key = {
      enable = false;
    };

    plugins.luasnip = {
      enable = true;
    };

    plugins.bufferline.enable = true;

    plugins.nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
        {name = "luasnip";}
        {name = "cmdline";}
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
      nvim-web-devicons
    ];

  };
}
