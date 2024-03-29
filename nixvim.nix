{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;

    options = {
      relativenumber = true;
      incsearch = true;
      swapfile = false;
      backup = false;
      wrap = false;
      smartindent = true;
      guicursor = "";
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      hlsearch = false;
      termguicolors = true;
      background = "dark";
      signcolumn = "yes";
      scrolloff = 8;
      colorcolumn = "80";
      laststatus = 3;
      undofile = true;
    };

    extraConfigLua = ''
      vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    '';

    globals = {
      mapleader = " ";
    };

    keymaps = [
      {
        action = "${"[[\"_dP]]"}";
        key = "<leader>p";
        options = {
          silent = false;
        };
        mode = "x";
      }
      {
        action = "${"[[\"+Y]]"}";
        key = "<leader>Y";
        options = {
          silent = false;
        };
      }
      {
        action = "${"[[\"+y]]"}";
        key = "<leader>y";
        options = {
          silent = false;
        };
      }
      {
        action = "Nzzzv";
        key = "N";
        options = {
          silent = false;
        };
      }
      {
        action = "nzzzv";
        key = "n";
        options = {
          silent = false;
        };
      }
      {
        action = "<C-u>zz";
        key = "<C-u>";
        options = {
          silent = false;
        };
      }
      {
        action = "<C-d>zz";
        key = "<C-d>";
        options = {
          silent = false;
        };
      }
      {
        action = "<cmd>TmuxNavigateRight<cr>";
        key = "<M-l>";
        options = {
          silent = false;
        };
      }
      {
        action = "<cmd>TmuxNavigateDown<cr>";
        key = "<M-j>";
        options = {
          silent = false;
        };
      }
      {
        action = "<cmd>TmuxNavigateUp<cr>";
        key = "<M-k>";
        options = {
          silent = false;
        };
      }
      {
        action = "<cmd>TmuxNavigateLeft<cr>";
        key = "<M-h>";
        options = {
          silent = false;
        };
      }
      {
        action = "<cmd>UndotreeToggle<cr>";
        key = "<leader>u";
        options = {
          silent = false;
        };
      }
      {
        action = "<cmd>Telescope find_files<cr>";
        key = "<leader>sf";
        options = {
          silent = false;
        };
      }
      {
        action = "<cmd>Telescope git_files<cr>";
        key = "<leader>sg";
        options = {
          silent = false;
        };
      }
      {
        action = "<cmd>Telescope buffers<cr>";
        key = "<leader>sb";
        options = {
          silent = false;
        };
      }
      {
        action = "<cmd>Telescope oldfiles<cr>";
        key = "<leader>so";
        options = {
          silent = false;
        };
      }
      {
        action = "<cmd>Telescope help_tags<cr>";
        key = "<leader>sh";
        options = {
          silent = false;
        };
      }
      {
        action = "<cmd>Telescope live_grep<cr>";
        key = "<leader>sw";
        options = {
          silent = false;
        };
      }
    ];

    autoCmd = [
      {
        event = [ "BufWritePre" ];
        callback = { __raw = "function() vim.lsp.buf.format({async = true}) end"; };
      }
    ];

    plugins = {
      fugitive.enable = true;
      comment-nvim.enable = true;
      tmux-navigator.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      undotree.enable = true;
      nix.enable = true;
      gitsigns = {
        enable = true;
        currentLineBlame = true;
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
        keymaps = {
          diagnostic = {
            "[d" = "goto_prev";
            "]d" = "goto_next";
            "gl" = "open_float";
          };
          lspBuf = {
            "K" = "hover";
            "gd" = "definition";
            "gD" = "declaration";
            "gi" = "implementation";
            "go" = "type_definition";
            "gr" = "references";
            "gs" = "signature_help";
            "<leader>rn" = "rename";
            "<leader>f" = "format";
            "<leader>ca" = "code_action";
          };
        };
      };
    };
  };
}

