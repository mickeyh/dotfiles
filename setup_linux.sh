#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "Installing apt packages required to run."
echo ""
sudo apt update
sudo apt install -y \
    curl

echo ""
echo "Seting up VSCode maintenance via apt."
echo ""
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

echo ""
echo "Installing apt packages that this script provides."
echo ""
# NOTE: `suckless-tools` provides `dmenu`.
sudo apt update
sudo apt install -y \
    checkinstall \
    code \
    feh \
    firefox \
    git \
    gnome-keyring \
    i3status \
    i3-wm \
    notification-daemon \
    suckless-tools \
    terminator \
    virtualenvwrapper \
    zsh

echo ""
echo "Installing Oh My Zsh."
echo ""
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"
if [[ ! -d "$OH_MY_ZSH_DIR" ]]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git "$OH_MY_ZSH_DIR"
fi
chsh -s /bin/zsh

echo ""
echo "Installing fasd manually."
echo ""
# When there is a deb for 18.04 we should install from the PPA.
REPOS_DIR="$HOME/repos"
FASD_DIR="$REPOS_DIR/fasd"
if [[ ! -d "$FASD_DIR" ]]; then
    mkdir -p "$REPOS_DIR"
    git clone https://github.com/clvv/fasd.git "$FASD_DIR"
    pushd "$FASD_DIR"
    sudo checkinstall
    popd  # $FASD_DIR
fi

echo ""
echo "Symlinking configuration files into home directory."
echo ""
"$SCRIPTDIR/setup_symlinks.sh"

echo ""
echo "Done!"
echo ""
