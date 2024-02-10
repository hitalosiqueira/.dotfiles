{ config, pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    wrapperFeatures.gtk = true;
    # Sway-specific Configuration
    config = {
      modifier = "Mod4";
      fonts = {
        names = [ "MesloLGS NF" ];
        style = "Regular";
        size = 13.0;
      };
      terminal = "kitty";
      menu = "wofi --show run";
      # Status bar(s)
      bars = [{
        fonts.size = 11.0;
        position = "top";
      }];
      # Display device configuration
      output = {
        eDP-1 = {
          # Set HIDP scale (pixel integer scaling)
          scale = "1.5";
        };
      };
    };
    # End of Sway-specificc Configuration
  };
}
