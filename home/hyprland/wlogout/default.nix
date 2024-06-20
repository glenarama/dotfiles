{
  programs.wlogout = {
    enable = true;
    layout = [
      {
          "label" = "lock";
          "action" = "hyprlock";
          "text" = "Lick";
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
            font-size: 16px;
        }

        @import '../../.cache/ags/color.css';

        window {
            background-color: transparent;
        }

        button {
            color: @forground;
            background-color: @background;
            outline-style: none;
            border: none;
            border-width: 0px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 10%;
            border-radius: 0px;
            box-shadow: none;
            text-shadow: none;
            animation: gradient_f 20s ease-in infinite;
        }

        button:focus {
            background-color: @color6;
            background-size: 20%;
        }

        button:hover {
            background-color: @color11
            background-size: 25%;
            border-radius: 20px;
            animation: gradient_f 20s ease-in infinite;
            transition: all 0.3s cubic-bezier(.55,0.0,.28,1.682);
        }

        button:hover#lock {
            border-radius: 20px 20px 0px 20px;
            margin : 5px 0px 0px 5px;
        }

        button:hover#logout {
            border-radius: 20px 0px 20px 20px;
            margin : 0px 0px 5px 5px;
        }

        button:hover#shutdown {
            border-radius: 20px 20px 20px 0px;
            margin : 5px 5px 0px 0px;
        }

        button:hover#reboot {
            border-radius: 0px 20px 20px 20px;
            margin : 0px 5px 5px 0px;
        }

        #lock {
            background-image: image(url("$HOME/.config/wlogout/icons/lock_white.png"), url("/usr/share/wlogout/icons/lock.png"), url("/usr/local/share/wlogout/icons/lock.png"));
            border-radius: 20px 0px 0px 0px;
            margin : 5px 0px 0px 5px;
        }

        #logout {
            background-image: image(url("$HOME/.config/wlogout/icons/logout_white.png"), url("/usr/share/wlogout/icons/logout.png"), url("/usr/local/share/wlogout/icons/logout.png"));
            border-radius: 0px 0px 0px 20px;
            margin : 0px 0px 5px 5px;
        }

        #shutdown {
            background-image: image(url("$HOME/.config/wlogout/icons/shutdown_white.png"), url("/usr/share/wlogout/icons/shutdown.png"), url("/usr/local/share/wlogout/icons/shutdown.png"));
            border-radius: 0px 20px 0px 0px;
            margin : 5px 5px 0px 0px;
        }

        #reboot {
            background-image: image(url("$HOME/.config/wlogout/icons/reboot_white.png"), url("/usr/share/wlogout/icons/reboot.png"), url("/usr/local/share/wlogout/icons/reboot.png"));
            border-radius: 0px 0px 20px 0px;
            margin : 0px 5px 5px 0px;
        }
    '';
    home.file.".config/wlogout/icons/lock_white.png".source = ./lock_white.png;
    home.file.".config/wlogout/icons/logout_white.png".source = ./logout_white.png;
    home.file.".config/wlogout/icons/reboot_white.png".source = ./reboot_white.png;
    home.file.".config/wlogout/icons/shutdown_white.png".source = ./shutdown_white.png;
  };
}
