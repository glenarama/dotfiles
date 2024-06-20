{
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        preload = "$HOME/.cache/used_wallpaper";
        wallpaper = ",$HOME/.cache/used_wallpaper";
      };
    };
    wayland.windowManager.hyprland.extraConfig = ''
      exec-once=waypaper --restore
    '';
}
