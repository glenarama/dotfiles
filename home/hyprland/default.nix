{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
        monitor=[
        "DP-1,3440x1440,auto,1"
        "Unknown-1,disable"
      ];
    };
  };

  home.packages = with pkgs; [
    hyprpaper
    hypridle
    ulauncher
    rofi
  ];

  imports = [
    ./keybindings.nix
    ./hyprpaper.nix
    ./decoration.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./wlogout.nix
    ./wallust
  ];

}

