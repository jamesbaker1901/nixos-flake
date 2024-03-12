{ config, pkgs, inputs, ... }: {
  programs.nixvim = {
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
      {
        key = "<F12>";
        action = ":FloatermNew<CR>";
        mode = "n";
        options = {
          noremap = true;
          silent = true;
        };
      }
    ];
  };
}
