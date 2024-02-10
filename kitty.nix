{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "MesloLGS NF";
      size = 16;
    };
  };
}
