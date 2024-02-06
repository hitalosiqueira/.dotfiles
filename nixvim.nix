{config, pkgs, inputs, ... }:
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

    # ... and plugins
    plugins = {
      telescope = {};
      treesitter = {};
    };

    colorschemes.gruvbox.enable = true;
  };
}

