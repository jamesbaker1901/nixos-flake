{ config, pkgs, inputs, ... }: {
  programs.nixvim = {
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

    plugins.treesitter = {
      enable = true;
      ensureInstalled = [ "rust" "bash" "json" "python" "yaml" "nix" "vim" ];
      nixvimInjections = true;
      indent = true;
    };

  };
}
