#!/bin/sh

fg=bbc2cf
wrong=ff6655
highlight=565f89
date=7aa2f7
verify=98be65

sleep 1 && eww -c /home/kuba/.config/eww/lock open-many music &

i3lock -n --force-clock -i ~/Downloads/wallpapers/city-landscape.png \
-F --screen 1 -e --indicator --radius=30 --ring-width=60 \
--inside-color=$fg \
--ring-color=$fg \
--insidever-color=$verify \
--ringver-color=$verify \
--insidewrong-color=$wrong \
--ringwrong-color=$wrong \
--line-uses-inside \
--keyhl-color=$verify \
--separator-color=$verify \
--bshl-color=$verify \
--time-str="%H:%M" --time-size=140 --date-str="%a, %d %b" --date-size=45 \
--verif-text="Verifying Password..." --wrong-text="Wrong Password!" \
--noinput-text="" --greeter-text="Type the password to Unlock" --ind-pos="300:610" \
--time-font="Sofia Pro:style=Bold" --date-font="Sofia Pro" --verif-font="Sofia Pro" \
--greeter-font="Sofia Pro" --wrong-font="Sofia Pro" --verif-size=23 --greeter-size=23 \
--wrong-size=23 --time-pos="300:390" --date-pos="300:450" --greeter-pos="300:780" \
--wrong-pos="300:820" --verif-pos="300:655" --date-color=$date --time-color=$date \
--greeter-color=$fg --wrong-color=$wrong --verif-color=$verify --verif-pos="300:820" \
--pointer=default --refresh-rate=0 --pass-media-keys --pass-volume-keys

eww -c /home/kuba/.config/eww/lock close-all &
