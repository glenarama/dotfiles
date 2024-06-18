#!/usr/bin/env bash
#                _ _                              
# __      ____ _| | |_ __   __ _ _ __   ___ _ __  
# \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__| 
#  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |    
#   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|    
#                   |_|         |_|               
#  
# by Stephan Raabe (2024) 
# ----------------------------------------------------- 

# Cache file for holding the current wallpaper
wallpaper_folder="$HOME/wallpaper"
cache_file="$HOME/.cache/current_wallpaper"
blurred="$HOME/.cache/blurred_wallpaper.png"
square="$HOME/.cache/square_wallpaper.png"
blur_file="$HOME/dotfiles/.settings/blur.sh"
used_wallpaper="$HOME/.cache/used_wallpaper"

blur="50x30"

# Create cache file if not exists
if [ ! -f $cache_file ] ;then
    touch $cache_file
    echo "$wallpaper_folder/default.jpg" > "$cache_file"
fi

current_wallpaper=$(cat "$cache_file")

case $1 in
    # Load wallpaper from .cache of last session 
    "init")
        sleep 0.5
        if [ -f $cache_file ]; then
            wallust run $current_wallpaper
            wallpaper=$current_wallpaper
        else
            wallust run $wallpaper_folder/default.jpg
            wallpaper=$wallpaper_folder/default.jpg
        fi
    ;;

    "select")
        sleep 0.2
        selected=$( find "$wallpaper_folder" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort -R | while read rfile
        do
            echo -en "$rfile\x00icon\x1f$wallpaper_folder/${rfile}\n"
        done | rofi -dmenu -i -replace -config ~/dotfiles/rofi/config-wallpaper.rasi)
        if [ ! "$selected" ]; then
            echo "No wallpaper selected"
            exit
        fi
        wallust run $wallpaper_folder/$selected
        wallpaper=$wallpaper_folder/$selected
    ;;

    # Randomly select wallpaper 
    *)
        wallust run $wallpaper_folder/default.jpg
        wallpaper=$wallpaper_folder/default.jpg
    ;;

esac

echo "Wallpaper: $wallpaper"

newwall=$(echo $wallpaper | sed "s|$wallpaper_folder/||g")
cp $wallpaper $HOME/.cache/
mv $HOME/.cache/$newwall $used_wallpaper

# ----------------------------------------------------- 
# Reload waybar with new colors
# -----------------------------------------------------
#$HOME/.config/home-manager/programs/waybar/launch.sh

hyprctl hyprpaper unload all
hyprctl hyprpaper preload $wallpaper
sleep 0.5

hyprctl hyprpaper wallpaper DP-1,$wallpaper

# ----------------------------------------------------- 
# Write selected wallpaper into .cache files
# ----------------------------------------------------- 
echo "$wallpaper" > "$cache_file"
magick $wallpaper -resize 75% $blurred

if [ ! "$blur" == "0x0" ] ;then
    magick $blurred -blur $blur $blurred
fi
magick $wallpaper -gravity Center -extent 1:1 $square

