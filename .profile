# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Default programs:
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=firefox
export FILE=thunar
export PAGER="less"

# Config
export LANG=en_US.UTF-8
export TERM=xterm-256color
export NVM_DIR="$HOME/.nvm"
export ZDOTDIR="$HOME/.config/zsh"
export _Z_DATA="$ZDOTDIR/.z"
export ERL_AFLAGS="-kernel shell_history enabled"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export VPN="$HOME/.config/vpn"

# Rust add to path
export PATH="$HOME/.cargo/bin:$PATH"

# Android
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"

# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
