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
      window = {
        border = 0;
        titlebar = false;
        hideEdgeBorders = "smart";
      };
      # Display device configuration
      output = {
        DP-1 = {
          scale = "1.0";
        };
        eDP-1 = {
          scale = "1.5";
        };
      };
    };
    extraConfig = ''
      # Brightness
      bindsym XF86MonBrightnessDown exec light -U 10
      bindsym XF86MonBrightnessUp exec light -A 10

      bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
      bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
      bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%

      exec sleep 5; systemctl --user start kanshi.service

      output "eDP-1" {
        disable
      }
    '';
    # End of Sway-specificc Configuration
  };
}
