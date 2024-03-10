{ config, pkgs, inputs, ... }: {
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      iconsEnabled = true;
      componentSeparators.left = "";
      componentSeparators.right = "";
      sectionSeparators.left = "";
      sectionSeparators.right = "";
      sections = { lualine_a = [ "mode" ]; };
    };
  };
}
