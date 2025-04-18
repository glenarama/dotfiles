{ config, pkgs, ... }:

{
  home.username = "glen";
  home.homeDirectory = "/home/glen";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    bun
    firefox
    google-chrome
    nerd-fonts.geist-mono
    nerd-fonts.jetbrains-mono
    killall
    nemo
    lm_sensors
    imagemagick
    glib
    zed-editor
    gifski
    neofetch
    cmatrix
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
