# Linux (Ubuntu 18.04)

To use these dotfiles on a fresh Ubuntu 18.04 installation run:
```
./setup_linux.sh
```

After setup you may want to:

   1. Add any workspace bindings, application bindings, or auto started programs you want to `i3/config` (there are TODOs marking where to do these).
   1. Change wlan0/eth0 in `i3/i3status_config` to your network interfaces. Remove any unecessary sections (battery on desktop, etc).
   1. Symlink your favorite wallpaper to `~/.wallpaper`.
   1. Install the MediterraneanNight gtk theme. This may include symlinking MediterraneanNight's `gtk-3.0` folder to the `$XDG_CONFIG_HOME/gtk-3.0` directory (`~/.config/gtk-3.0` by default).

Finally you may want to manually install:

   1. firefox plugins.
   1. startpage.
   1. tridactyl.
   1. multi-account containers.

# OSX

After cloning you may want to:

   1. Switch the Control and Capslock keys in System Preferences > Keyboard > Modifier keys (for Apple Internal Keyboard / Trackpad, NOT Karabiner VirtualHIDKeyboard).
   1. Install Karabiner-Elements and copy `osx/karabiner.json` into the root of Karabiner's config folder. Check the "Change left_command to command+control+option" "complex modification" is enabled.
   1. Set up spaces.
       1. Uncheck "Automatically rearrange..." in System Preferences > Mission Control.
       1. Create 10 total workspaces (press Control + Up to open Mission Control, then add them).
       1. In System Preferences > Keyboard > Shortcuts assign the right shortcuts for each workspace.
   1. In System Preferences > Keyboard > Shortcuts > Spotlight, set the spotlight search key to Hyper+D.
   1. Change the `virtualenv-wrapper` location in `zshrc`.
   1. Symlink `zshrc` to `~/.zshrc`.
   1. Symlink `osx/hammerspoon_init.lua` to `~/.hammerspoon/init.lua`.

Finally you man want to install (unless you change the corresponding configuration file):

   1. oh-my-zsh (`zshrc`).
   1. karabiner-elements (`hammerspoon`).
   1. hammerspoon (`hammerspoon`).
   1. pyenv-virtualenvwrapper (`zshrc`).
