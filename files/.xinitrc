\#!/bin/sh
# ~/.xinitrc

# system scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/* ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# themes
xrdb -merge "$HOME/.Xresources"
feh --no-fehbg --bg-fill '/home/lrb/images/wallpapers/main_monitor' '/home/lrb/images/wallpapers/second_monitor' '/home/lrb/images/wallpapers/third_monitor'

# lockscreen
/usr/bin/xss-lock -- /usr/bin/i3lock -c 000000 -e -f &
xidlehook --not-when-fullscreen --not-when-audio \
	--timer 60 \
		"xrandr --output DVI-D-0 --brightness .1;xrandr --output DVI-D-1 --brightness .1;xrandr --output HDMI-0 --brightness .1" \
		"xrandr --output DVI-D-0 --brightness 1;xrandr --output DVI-D-1 --brightness 1;xrandr --output HDMI-0 --brightness 1" \
	--timer 10 \
		"xrandr --output DVI-D-0 --brightness 1;xrandr --output DVI-D-1 --brightness 1;xrandr --output HDMI-0 --brightness 1;i3lock -c 000000 -e -f" \
		"" \
	--timer 3600 \
		"xrandr --output DVI-D-0 --brightness 1;xrandr --output DVI-D-1 --brightness 1;xrandr --output HDMI-0 --brightness 1;systemctl suspend" \
		"" &

# trays
pasystray &

# wm
exec i3
