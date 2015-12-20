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

# Start GNOME Keyring.
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# Start notification-daemon.
/usr/lib/notification-daemon-1.0/notification-daemon &

# Execute window manager.
dbus-launch --exit-with-session --sh-syntax i3
