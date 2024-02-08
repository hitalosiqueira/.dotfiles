{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;

    options = {
      relativenumber = true;
      incsearch = true;
    };

    globals = {
      mapleader = " ";
    };

    autoCmd = [
      {
        event = [ "BufWritePre" ];
        callback = { __raw = "function() vim.lsp.buf.format({async = true}) end"; };
      }
    ];
    # ... and plugins
    plugins = {
      telescope = {
        enable = true;
      };
      treesitter = {
        enable = true;
      };
      lsp = {
        enable = true;
        servers = {
          nil_ls = {
            enable = true;
            settings = {
              formatting = {
                command = [ "nixpkgs-fmt" ];
              };
            };
          };
          lua-ls = {
            enable = true;
          };
          bashls = {
            enable = true;
          };
        };
      };

    };

    colorschemes.catppuccin.enable = true;
  };
}

