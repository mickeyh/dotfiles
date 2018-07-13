#!/usr/bin/env bash
# NOTE: This script requires for you to have cloned dotfiles into ~/dotfiles.
set -euo pipefail
IFS=$'\n\t'

SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILESDIR="$SCRIPTDIR"

safe_rm() {
    TARGET="$1"
    if [[ -f "$TARGET" ]]; then
        rm -i "$TARGET"
    fi
    if [[ -d "$TARGET" ]]; then
        rm -ri "$TARGET"
    fi
}

# Remove dotfiles so we can later overwrite them.
safe_rm ~/.gtkrc-2.0
safe_rm ~/.i3
safe_rm ~/.zshrc
safe_rm ~/.config/terminator/config

# Make symlinks.
ln -s "$DOTFILESDIR/gtkrc-2.0" ~/.gtkrc-2.0
ln -s "$DOTFILESDIR/i3" ~/.i3
ln -s "$DOTFILESDIR/zshrc" ~/.zshrc
mkdir -p ~/.config/terminator
ln -s "$DOTFILESDIR/terminator_config" ~/.config/terminator/config
