{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.username = "glen";
  home.homeDirectory = "/home/glen";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    bun
    firefox
    chromium
    google-chrome
    nerdfonts
    killall
    cinnamon.nemo
    lm_sensors
    imagemagick
    neofetch
    glib
    zed-editor
    gifski
    albert
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
