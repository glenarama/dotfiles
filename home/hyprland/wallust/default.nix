{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wallust
  ];

  home.file.".config/wallust/wallust.toml".source = ./wallust.toml;
  home.file.".config/wallust/hyprland".source = ./hyprland;
  home.file.".config/wallust/ags".source = ./ags;
}

