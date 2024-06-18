{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
   kitty
  ];

  programs.kitty = {
    enable = true;

    font = {
        name = "JetBrainsMono Nerd Font";
        size = 13;
    };

    settings = {
      "window_padding_width" = "25";
    };
  };
}