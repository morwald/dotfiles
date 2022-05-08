#!/bin/sh

# colors from Xresources file
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# start mpd 
[ ! -s ~/.mpd/pid ] && mpd

# programs running in background
picom &
xbindkeys &
dunst &
udiskie &
unclutter &

# lock and suspend screen
xautolock -time 10 -locker "slock & gpgconf --kill gpg-agent" &
xautolock 15 -locker "systemctl suspend" &

# select monitor
autorandr --change

# custom scripts
/home/moritz/.scripts/fehbg
/home/moritz/.scripts/statusbar &
/home/moritz/.scripts/lowbattery &

# excecute dwm in forground
exec dwm


