{ config, pkgs, inputs, ... }: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [{ plugin = which-key-nvim; }];

    extraConfigLua = ''
            -- whick-key config
            local wk = require("which-key")
            wk.setup {
              ignore_missing = true,
              layout = {
                align = "center",
              },
              triggers = {"<leader>", "`"},
            }
           
            -- default menu
          	wk.register({
      	      f = {"<cmd>Telescope find_files<cr>",   "find files"},
              h = {"<C-W>s",                          "split below"},
              v = {"<C-W>v",                          "split right"},
              S = {"<cmd>Startify<cr>",               "start screen"},
              E = {"<cmd>SSave<cr>",                  "save session"},
            }, { prefix = "<leader>" })

            -- misc
          	wk.register({
                m = {
                  name = "+misc",
                  x = {"<cmd>syntax on<cr>",              "syntax on"},
                  n = {"<cmd>set rnu<cr>",                "relative line numbers"},
                  i = {"<cmd>IndentBlanklineToggle<cr>",  "indent lines"},
              },
            }, { prefix = "<leader>" })

            -- lsp
          	wk.register({
                l = {
                  name = "+lsp",
                  q = {"<cmd>Telescope quickfix<cr>",                 "quickfix list"},
                  r = {"<cmd>Telescope lsp_references<cr>",           "references"},
                  a = {"<cmd>Telescope lsp_code_actions<cr>",         "code actions"},
                  d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "diagnostics"},
                  t = {"<cmd>Telescope treesitter<cr>",               "treesitter"},
                  i = {"<cmd>LspInfo<cr>",                            "LspInfo"},
              },
            }, { prefix = "<leader>" })

            -- search
            wk.register({
              s = {
                name = "+search",
                b = {"<cmd>Telescope current_buffer_fuzzy_find<cr>",  "current buffer"},
                B = {"<cmd>Telescope buffers<cr>",  "open buffers"},
                c = {"<cmd>Telescope git_commits<cr>",  "commits"},
                C = {"<cmd>Telescope git_bcommits<cr>",  "buffer commits"},
                f = {"<cmd>Telescope find_files<cr>",  "files"},
                g = {"<cmd>Telescope git_files<cr>",  "git files"},
                m = {"<cmd>Telescope marks<cr>",  "marks"} ,
                p = {"<cmd>Telescope helptags<cr>",  "help tags"} ,
                P = {"<cmd>Telescope tags<cr>",  "project tags"},
              },
            }, { prefix = "<leader>" })

            -- git
            wk.register({
              g = {
                name = "+git", 
                a = {"<cmd>Git add .<cr>", "add ."},
                c = {"<cmd>Git commit<cr>", "commit"},
                p = {"<cmd>Git push<cr>", "push"},
                b = {"<cmd>Git blame<cr>", "blame"},
                d = {"<cmd>Git diff<cr>", "diff"},
                w = {"<cmd>GBrowse<cr>", "browse"},
              },
            }, { prefix = "<leader>" })
    '';
  };
}
