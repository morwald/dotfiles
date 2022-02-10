#!/bin/sh

# colors from Xresources file
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# custom scripts
/home/moritz/.scripts/statusbar &
/home/moritz/.scripts/lowbattery &
/home/moritz/.scripts/fehbg &

# ch keyboard layout
setxkbmap -layout ch

# caps lock is escape
setxkbmap -option caps:escape

# programs running in background
picom &
xbindkeys &
dunst &
udiskie &
unclutter &
mpd &
xautolock -time 10 -locker slock &

# excecute dwm in forground
exec dwm
