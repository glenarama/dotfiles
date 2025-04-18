{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
        monitor=[
        "DP-1,3440x1440,auto,auto"
      ];
    };
  };

  home.packages = with pkgs; [
    hyprpaper
    waypaper
    swww
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
    ./wlogout
    ./wallust
  ];

}
