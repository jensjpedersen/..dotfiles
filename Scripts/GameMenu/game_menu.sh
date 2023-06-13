#!/bin/bash
#
console_dir=( $(ls $games_dir) )
root_dir=$(dirname $(realpath $0))
thumb_dir="$root_dir/libretro-thumbnails"

hwmodel=$(hostnamectl | awk -F ": " '/Hardware Model:/ {print $2}')

if [[ $hwmodel == "ThinkCentre M900" ]]; then
    games_dir="/mnt/hdd/ManjaroSSD/Games/"
elif [[ $hwmodel == "ThinkPad W530" ]]; then
    games_dir="/mnt/ssd/Games/"
fi


function download_thumbnails { 
    if [ ! -d "$thumb_dir" ]; then
        cd $root_dir
        git clone https://github.com/libretro-thumbnails/libretro-thumbnails
    fi

    if [ ! -d "thumbnails" ]; then
        cd $root_dir
        mkdir thumbnails
    fi

    for d in "${console_dir[@]}"; do 
        console=$(echo $d | tr '_' ' ')
        console_url=$(ls $thumb_dir | grep -i "$console" | sort | head -n 1)
        console_url=$(echo $console_url | tr ' ' '_')


        for f in "$games_dir""$d"/*; do 


            # if empty console url 
            [[ -z "$console_url" ]] && break

            file_name="${f##*/}"

            # echo $console_url

            if [ $console_url = "Nintendo_-_GameCube" ]; then

                if [ ! -d "thumbnails/$console" ]; then
                    mkdir "thumbnails/$console"
                fi

                # remove .iso .nkit
                game_name=$(echo "$file_name" | sed -e 's/\.iso//' -e 's/\.nkit//')
                # game_url=$(echo "$game_name" | sed -e 's/ /\%20/g')
                img_url="$game_name"".png"

                url="https://raw.githubusercontent.com/libretro-thumbnails/""$console_url""/master/Named_Boxarts/""$img_url"


                if [ ! -f "thumbnails/$console/$img_url" ]; then 
                    wget -q --directory-prefix "thumbnails/$console" "$url" || echo "download failed: $game_name"
                fi

                # ping -c 1 "$url" && echo $game_name
                # wget -q "$url" || echo "download failed: $game_name"
            fi

        done


    done

}



function game_picker {

    choice=$(sxiv -of $root_dir/thumbnails/**/*)
    choice=$(echo "$choice" | head -n 1) 

    [[ -z "$choice" ]] && exit 0


    if echo $choice | grep -q "gamecube"; then

        file_search=$(echo "$choice" | sed -e 's/\.png//')
        file_search=$(basename "$file_search")

        result=$(find $games_dir -name "*$file_search*")
        dolphin-emu -e "$result" &

        id=$(xdotool search --name "dolphin-emu" | head -n 1)

        xdotool key --window $id 'super+f'



    fi


}



function main {
    download_thumbnails
    game_picker


}


main



