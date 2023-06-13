#!/bin/bash
#
export DISPLAY=:0

hwmodel=$(hostnamectl | awk -F ": " '/Hardware Model:/ {print $2}')

if [[ $hwmodel == "ThinkCentre M900" ]]; then
    games_dir="/mnt/hdd/ManjaroSSD/Games/"
elif [[ $hwmodel == "ThinkPad W530" ]]; then
    games_dir="/mnt/ssd/Games/"
fi

console_dir=( $(ls $games_dir) )
root_dir=$(dirname $(realpath $0))


function download_thumbnails { 

    if [ ! -d "$root_dir/thumbnails" ]; then
        mkdir thumbnails
    fi


    for d in "${console_dir[@]}"; do 

        for f in "$games_dir""$d"/*; do 

            file_name="${f##*/}"

            if [ ! -d "thumbnails/$d" ]; then
                mkdir "thumbnails/$d"
            fi

            if [ $d = "gamecube" ]; then

                game_name=$(echo "$file_name" | sed -e 's/\.iso//' -e 's/\.nkit//')
                img_url="$game_name"".png"
                url="https://raw.githubusercontent.com/libretro-thumbnails/Nintendo_-_GameCube/master/Named_Boxarts/""$img_url"

            elif [ $d = 'play_station_2' ]; then 

                game_name=$(echo "$file_name" | sed -e 's/\.iso//')
                img_url="$game_name"".png"
                url="https://raw.githubusercontent.com/libretro-thumbnails/Sony_-_PlayStation_2/733507283dd0f52e3b8a47fe0a139be13f82903a/Named_Boxarts/$img_url"

            elif [ $d = 'nintendo_64' ]; then 

                game_name=$(echo "$file_name" | sed -e 's/\.z64//')
                img_url="$game_name"".png"
                url="https://raw.githubusercontent.com/libretro-thumbnails/Nintendo_-_Nintendo_64/c9278f93bfbcb41e4e728b952b25e6cc2ab6830f/Named_Boxarts/$img_url"

            else
                break 
            fi

            if [ ! -f "thumbnails/$d/$img_url" ]; then 
                wget -q --directory-prefix "thumbnails/$d" "$url" || echo "download failed: $game_name"
            fi


        done


    done

}



function game_picker {

    choice=$(sxiv -of $root_dir/thumbnails/**/*)
    choice=$(echo "$choice" | head -n 1) 

    [[ -z "$choice" ]] && exit 0


    file_search=$(echo "$choice" | sed -e 's/\.png//')
    file_search=$(basename "$file_search")

    result=$(find $games_dir -name "*$file_search*")

    if echo $choice | grep -q "gamecube"; then

        dolphin-emu -e "$result" &

        sleep 2 

        id=$(xdotool search --name "dolphin-emu" | head -n 1)

        xdotool key --window $id 'super+f'



    elif echo $choice | grep -q "nintendo_64"; then 
        # Nintendo 64

        if which org.libretro.RetroArch && [ -f "${HOME}/.var/app/org.libretro.RetroArch/config/retroarch/cores/mupen64plus_next_libretro.so" ]; then
            org.libretro.RetroArch -f -L "${HOME}/.var/app/org.libretro.RetroArch/config/retroarch/cores/mupen64plus_next_libretro.so" "$result" &
        fi

    elif echo $choice | grep -q "play_station_2"; then
        # Playstation 2
        which pcsx2-qt && pcsx2-qt "$result" &



    fi


}



function main {
    download_thumbnails
    game_picker


}


main



