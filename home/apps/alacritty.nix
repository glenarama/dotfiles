{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
   alacritty
  ];

  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal = {
            family = "JetBrainsMono Nerd Font";
            style = "Regular";
        };
        size = 13;
      };

      window = {
        padding = {
          x = 25;
          y = 25;
        };
      };
    };
  };
}