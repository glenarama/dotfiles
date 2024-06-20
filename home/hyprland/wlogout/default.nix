{
  programs.wlogout = {
    enable = true;
    layout = [
      {
          "label" = "lock";
          "action" = "hyprlock";
          "text" = "Lock";
          "keybind" = "l";
      }
      {
          "label" = "logout";
          "action" = "hyprctl dispatch exit 0";
          "text" = "Logout";
          "keybind" = "e";
      }
      {
          "label" = "shutdown";
          "action" = "systemctl poweroff";
          "text" = "Shutdown";
          "keybind" = "s";
      }
      {
          "label" = "reboot";
          "action" = "systemctl reboot";
          "text" = "Reboot";
          "keybind" = "r";
      }
    ];
    style = ''
        * {
            background-image: none;
            font-family: "JetBrains Mono", monospace;
            font-size: 16px;
        }

        @import '../../.cache/ags/color.css';

        window {
            background-color: @background;
            color: @color0;
            margin-top: 1000px;
            margin-bottom: 1000px;
        }

        button {
            background-color: @color8;
            outline-style: none;
            border: none;
            border-width: 0px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 10%;
            border-radius: 0px;
            box-shadow: none;
            text-shadow: none;
            color: @color0;
            animation: gradient_f 20s ease-in infinite;
        }
        button:focus {
            background-color: @color1;
            background-size: 20%;
        }

        button:hover {
            background-color: @color11;
            background-size: 25%;
            animation: gradient_f 20s ease-in infinite;
            transition: all 0.3s cubic-bezier(.55,0.0,.28,1.682);
        }

        button:hover#lock {
            border-radius: 50px 50px 0px 50px;
            margin : 250px 0px 0px 1150px;
        }

        button:hover#logout {
            border-radius: 50px 0px 50px 50px;
            margin : 0px 0px 250px 1150px;
        }

        button:hover#shutdown {
            border-radius: 50px 50px 50px 0px;
            margin : 250px 1150px 0px 0px;
        }

        button:hover#reboot {
            border-radius: 0px 50px 50px 50px;
            margin : 0px 1150px 250px 0px;
        }

        #lock {
            background-image: image(url("./icons/lock.png"), url("/usr/share/wlogout/icons/lock.png"), url("/usr/local/share/wlogout/icons/lock.png"));
            border-radius: 70px 0px 0px 0px;
            margin : 300px 0px 0px 1200px;
        }

        #logout {
            background-image: image(url("./icons/logout.png"), url("/usr/share/wlogout/icons/logout.png"), url("/usr/local/share/wlogout/icons/logout.png"));
            border-radius: 0px 0px 0px 70px;
            margin : 0px 0px 300px 1200px;
        }

        #shutdown {
            background-image: image(url("./icons/shutdown.png"), url("/usr/share/wlogout/icons/shutdown.png"), url("/usr/local/share/wlogout/icons/shutdown.png"));
            border-radius: 0px 70px 0px 0px;
            margin : 300px 1200px 0px 0px;
        }

        #reboot {
            background-image: image(url("./icons/reboot.png"), url("/usr/share/wlogout/icons/reboot.png"), url("/usr/local/share/wlogout/icons/reboot.png"));
            border-radius: 0px 0px 70px 0px;
            margin : 0px 1200px 300px 0px;
        }
    '';
    };
    home.file.".config/wlogout/icons/lock.png".source = ./lock_black.png;
    home.file.".config/wlogout/icons/logout.png".source = ./logout_black.png;
    home.file.".config/wlogout/icons/reboot.png".source = ./reboot_black.png;
    home.file.".config/wlogout/icons/shutdown.png".source = ./shutdown_black.png;
}
