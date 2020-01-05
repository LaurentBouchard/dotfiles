#!/bin/sh
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

# trays
pasystray &

# wm
exec i3
