{
    services.hypridle = {
        enable = true;
        settings = {
            general = {
                lock_cmd = "hyprlock";
                ignore_dbus_inhibit = false;
            };
            listener = [
            {
                timeout = 300;    
                on-timeout = "sleep 1 && hyprctl dispatch dpms off";       
                on-resume = "sleep 1 && hyprctl dispatch dpms on";         
            } 
            {
                timeout = 1200;                                          
                on-timeout = "systemctl suspend";
            }];
        };
    };
    wayland.windowManager.hyprland.extraConfig = ''
      exec-once = hypridle
    '';
}