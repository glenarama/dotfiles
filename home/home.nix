{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.username = "glen";
  home.homeDirectory = "/home/glen";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    bun
    firefox
    nerdfonts
    killall
    gnome.nautilus
    lm_sensors
    imagemagick
    neofetch
    matugen
    zed-editor
  ];

  programs.home-manager.enable = true;
  
  imports = [
    ./hyprland
    ./ags
    ./apps
  ];
}
