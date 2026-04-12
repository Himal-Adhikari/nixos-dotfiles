{ pkgs, ... }:

let
  scriptContent = ''
    #!/usr/bin/env bash
    
    WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
    INTERVAL=1800

    change_wallpaper() {
        RANDOM_WP=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

        if [ -n "$RANDOM_WP" ]; then
            swaybg -m fill -i "$RANDOM_WP" &
            NEW_PID=$!
            sleep 0.5
            pgrep swaybg | grep -v "$NEW_PID" | xargs -r kill
            echo "$RANDOM_WP" > ~/.config/hypr/wallpaper-path.txt
        fi
    }

    if [ "$1" = "daemon" ]; then
        while true; do
            change_wallpaper
            sleep $INTERVAL
        done
    else
        change_wallpaper
    fi
  '';
in
{
  home.packages = with pkgs; [
    (writeScriptBin "hypr-wallpaper" scriptContent)
    
    swaybg      
    findutils   
    coreutils   
    procps      
    gnugrep
  ];
}
