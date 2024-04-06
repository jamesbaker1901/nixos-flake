{ config, pkgs, inputs, ... }: {
  programs.nixvim = {
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
      fileformats = [ "unix" "dos" "mac" ];
      ignorecase = true;
      smartcase = true;
      lazyredraw = true;
      clipboard = "unnamed";
      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      updatetime = 300;
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
      vim.api.nvim_command("autocmd InsertEnter * norm zz")
      vim.cmd "hi Normal guibg=NONE ctermbg=NONE"
      vim.cmd "let base16colorspace=256" 
      vim.cmd "set cmdheight=1"
      vim.cmd "set timeoutlen=150"
      vim.cmd "set ttimeoutlen=10"
      vim.cmd "set cmdheight=0"
    '';
  };
}
