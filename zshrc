#-------------------------------------------------------------------------------
#  oh-my-zsh Boilerplate. {{{1
#-------------------------------------------------------------------------------
# Path to your oh-my-zsh configuration.
ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# mrtazz
# fwalch
# wuffers
# nicoulaj*
# jbergantine
# clean
ZSH_THEME="nicoulaj"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"
# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    fasd
    gitfast
    golang
    tig
    tmux
    vscode
)

source "$ZSH/oh-my-zsh.sh"

# Customize to your needs...

#-------------------------------------------------------------------------------
#  Environment. {{{1
#-------------------------------------------------------------------------------

source /etc/profile
# TODO(OSX): This should be /usr/local/bin/virtualenvwrapper.sh on OSX.
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

export LS_COLORS="di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186"

# Bazel needs Python2.
export BAZEL_PYTHON=/usr/bin/python2

# Go.
export GOPATH=~/go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
# Cuda.
#export PATH=/opt/cuda/bin${PATH:+:${PATH}}
#export LD_LIBRARY_PATH=/opt/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# To make Vim respect colorschemes.
export TERM=xterm-256color

export BROWSER=firefox
export EDITOR=vim

#-------------------------------------------------------------------------------
#  Aliases. {{{1
#-------------------------------------------------------------------------------

alias cd=git-cd
# fasd gvim.
alias v="fasd -f -e gvim"

#-------------------------------------------------------------------------------
#  Completion. {{{1
#-------------------------------------------------------------------------------

# Force file completion with ^F.
zle -C complete-file complete-word _generic
zstyle ':completion:complete-file::::' completer _files
bindkey '^[[Z' complete-file

# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'Specify: %d'
zstyle ':completion:*' completer _complete _ignored _files
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '+' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt '%e Errors'
zstyle ':completion:*' substitute 'NUMERIC == 3'
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/mh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Add gcloud completion if possible. Apparently this has to come after the init of the completion
# system.
if [[ -d /opt/google-cloud-sdk/ ]]; then
    source /opt/google-cloud-sdk/*.zsh.inc
fi

#-------------------------------------------------------------------------------
#  Regular widgets and functions. {{{1
#-------------------------------------------------------------------------------

# cd to (in order of preference): git project root, parent git project root, ~.
function git-cd() {
    if [[ $# -ne 0 ]]; then
        builtin cd "$@"
    else
        local SHOULD_GIT_CD
        SHOULD_GIT_CD="$(cd ..; git rev-parse --is-inside-work-tree 2> /dev/null)"
        if [[ "$SHOULD_GIT_CD" = "true" ]]; then
            local CD_CMD
            CD_CMD="$(cd ..; git rev-parse --show-cdup 2> /dev/null)"
            builtin cd ../"$CD_CMD"
        else
            builtin cd
        fi
    fi
}

# These functions let one search through local (per-shell) history with ^P/^N
# while ^R searches across shared history.
function my-local-history-beginning-search-backward() {
    zle set-local-history 1
    zle history-beginning-search-backward
    zle set-local-history 0
}
zle -N my-local-history-beginning-search-backward

function my-local-history-beginning-search-forward() {
    zle set-local-history 1
    zle history-beginning-search-forward
    zle set-local-history 0
}
zle -N my-local-history-beginning-search-forward

#-------------------------------------------------------------------------------
#  History settings. {{{1
#-------------------------------------------------------------------------------

HISTFILE="$HOME/.histfile"
HISTFILESIZE=131072
HISTSIZE=16384
SAVEHIST=$HISTSIZE

#-------------------------------------------------------------------------------
# Options. {{{1
#-------------------------------------------------------------------------------

# Changing directories.
setopt \
    AUTO_CD \
    AUTO_PUSHD \
    PUSHD_IGNORE_DUPS \

# Completion.
setopt \
    AUTO_PARAM_SLASH \
    NO_AUTO_MENU \
    NO_AUTO_REMOVE_SLASH \
    NO_CORRECT \
    NO_CORRECT_ALL \
    NO_LIST_AMBIGUOUS \
    LIST_PACKED \
    LIST_ROWS_FIRST \

# Expansion and globbing.
setopt \
    MAGIC_EQUAL_SUBST \

# History.
setopt \
    HIST_EXPIRE_DUPS_FIRST \
    HIST_FIND_NO_DUPS \
    HIST_IGNORE_SPACE \
    HIST_SAVE_NO_DUPS \
    INC_APPEND_HISTORY \
    SHARE_HISTORY \

# Zle.
setopt \
    NO_BEEP \

#-------------------------------------------------------------------------------
#  Prompt. {{{1
#-------------------------------------------------------------------------------

zstyle ':vcs_info:*:*' check-for-changes false  # Avoid lag on big repos.

#-------------------------------------------------------------------------------
#  ZLE behaviour. {{{1
#-------------------------------------------------------------------------------

bindkey -e

# Pattern search.
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# iPython-ish ^P and ^N.
bindkey '^P' my-local-history-beginning-search-backward
bindkey '^N' my-local-history-beginning-search-forward

# Bash-like ^U.
bindkey '^U' backward-kill-line

#-------------------------------------------------------------------------------
#  Services. {{{1
#-------------------------------------------------------------------------------

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# vim: set ft=zsh ts=4 sw=4 et foldmethod=marker :
