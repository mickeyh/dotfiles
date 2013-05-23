#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
   for f in /etc/X11/xinit/xinitrc.d/*; do
      [ -x "$f" ] && . "$f"
   done
   unset f
fi

# If ~/.Xmodmap is present use it.
if [ -s ~/.Xmodmap ]; then
   xmodmap ~/.Xmodmap
fi

# Execute window manager.
exec i3
