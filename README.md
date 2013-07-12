Some dotfiles.

After cloning you may want to:
   1. Symlink the desired dotfiles into their respective places. If you cloned into `~/dotfiles` then `setup_symlinks.sh` will try to create all symlinks, overwriting existing dotfiles if you agree to their removal.
   2. Add any workspace bindings, application bindings, or auto started programs you want to `i3/config` (there are TODOs marking where to do these).
   3. Change wlan0/eth0 in `i3/i3status_config` to your network interfaces.
   3. Symlink your favorite wallpaper to `~/.wallpaper`.
   4. Install the MediterraneanNight gtk theme. This may include symlinking MediterraneanNight's `gtk-3.0` folder to your `$XDG_CONFIG_HOME` directory (`~/.config` by default).

Finally you man want to install (unless you change the corresponding configuration file):
   1. dmenu (`i3/config`)
   2. feh (`i3/config`)
   3. firefox (`i3/config`)
   4. slock (`i3/config`)
   5. chromium (`i3/config`)
   6. oh-my-zsh (`zshrc`)
