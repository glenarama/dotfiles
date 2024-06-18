{ pkgs, ... }:

{

  wayland.windowManager.hyprland.extraConfig = ''
    source = ./colors.conf

    general {
      layout = master
      resize_on_border = true
      gaps_in = 6
      gaps_out = 10
      border_size = 1
      col.active_border = $color1
      col.inactive_border = $color8
    }


    master {
        new_is_master = true
        special_scale_factor = 1
        mfact = 0.5
        orientation = left
    }

    decoration {
        rounding = 8
        blur {
            enabled = true
            size = 9
            passes = 2
            new_optimizations = on
            ignore_opacity = true
            xray = true
        }
        active_opacity = 0.9
        inactive_opacity = 0.6
        fullscreen_opacity = 1.0

        drop_shadow = true
        shadow_range = 5
        shadow_render_power = 2
        col.shadow = 0x66000000
    }

    animations {
        enabled = true

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 7, myBezier
        animation = windowsIn, 1, 7, myBezier, slide
        animation = windowsOut, 1, 7, default, slide
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default, slidefade 20%
    }
'';

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 16;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name 		= "WhiteSur";
      package 		= pkgs.whitesur-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
  };
}