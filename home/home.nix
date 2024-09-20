{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.username = "glen";
  home.homeDirectory = "/home/glen";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    bun
    firefox
    google-chrome
    nerdfonts
    killall
    nemo
    lm_sensors
    imagemagick
    glib
    zed-editor
    gifski
    albert
    neofetch
  ];

  nixpkgs.config = {
     chromium = {
       enableWideVine = true;
      };
  };

  programs.home-manager.enable = true;
  programs.mpv.enable = true;

  imports = [
    ./hyprland
    ./ags
    ./apps
  ];
}
