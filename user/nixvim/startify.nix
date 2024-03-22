{ config, pkgs, inputs, ... }: {
  programs.nixvim = {
    plugins.startify = {
      enable = true;
      customHeader = [
        "            ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗"
        "            ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║"
        "            ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║"
        "            ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║"
        "            ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║"
        "            ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"
      ];
      paddingLeft = 12;
      sessionAutoload = true;
      sessionDeleteBuffers = true;
      sessionPersistence = true;
      enableSpecial = false;
      sessionDir = "~/.config/nvim/session";
    };
    extraConfigLua = ''
      vim.cmd "let g:startify_lists = [ { 'type': 'sessions',  'header': ['   Sessions']       }, { 'type': 'bookmarks', 'header': ['   Bookmarks']      }, { 'type': 'files',     'header': ['   Files']            }, { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] }, ]"
    '';

  };
}
