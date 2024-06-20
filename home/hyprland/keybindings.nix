{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    input = {
      "kb_options" = "caps:super";
    };

    windowrule = [
      "float,^(waypaper)$"
    ];

    bindm = [
      "$mod, mouse:273, resizewindow"
      "$mod, mouse:272, movewindow"
    ];
    bind = [
      "$mod, RETURN, exec, alacritty"
      "$mod, K, exec, kitty"
      "$mod, Q, killactive"
      "$mod, B, exec, chromium-browser"
      "$mod, E, exec, nemo"
      "$mod, F, fullscreen"
      "$mod, T, togglefloating"
      "$mod SHIFT, T, exec, hyprctl dispatch workspaceopt allfloat"
      "$mod, W, exec, waypaper"
      "$mod, SPACE, exec, ulauncher --no-window-shadow"
      "$mod, Escape, exec, wlogout"

      # Window Management
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 0"
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 0"
      "ALT, right, workspace, +1"
      "ALT, left, workspace, -1"
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod CTRL,right,swapwindow, r"
      "$mod CTRL, left, swapwindow, l"
      "$mod CTRL, up, swapwindow, u"
      "$mod CTRL, down, swapwindow, d"
      "$mod SHIFT, right, resizeactive, 100 0"
      "$mod SHIFT, left, resizeactive, -100 0"
      "$mod SHIFT, up, resizeactive, 0 -100"
      "$mod SHIFT, down, resizeactive, 0 100"
    ];
  };
}
