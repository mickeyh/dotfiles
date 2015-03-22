#!/bin/bash
# NOTE: This script requires for you to have cloned dotfiles into ~/dotfiles.

DOTFILESDIR="./dotfiles"

echo $DOTFILESDIR

# Remove dotfiles so we can later overwrite them.
rm -i ~/.Xdefaults
rm -i ~/.Xmodmap
rm -i ~/.gtkrc-2.0
rm -rfi ~/.i3
rm -rfi ~/.vimperator
rm -i ~/.vimperatorrc
rm -i ~/.xinitrc
rm -i ~/.zshrc
rm -i ~/.config/terminator/config

# Make symlinks.
ln -s $DOTFILESDIR/Xdefaults ~/.Xdefaults
ln -s $DOTFILESDIR/Xmodmap ~/.Xmodmap
ln -s $DOTFILESDIR/gtkrc-2.0 ~/.gtkrc-2.0
ln -s $DOTFILESDIR/i3 ~/.i3
ln -s $DOTFILESDIR/vimperator ~/.vimperator
ln -s $DOTFILESDIR/vimperator/vimperatorrc ~/.vimperatorrc
ln -s $DOTFILESDIR/xinitrc ~/.xinitrc
ln -s $DOTFILESDIR/zshrc ~/.zshrc
mkdir -p ~/.config/terminator
ln -s $DOTFILESDIR/terminator_config ~/.config/terminator/config
