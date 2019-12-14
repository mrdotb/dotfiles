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

# Config
export LANG=en_US.UTF-8
export TERM=xterm-256color
export NVM_DIR="$HOME/.nvm"
export ZDOTDIR="$HOME/.config/zsh"

# Rust add to path
export PATH="$HOME/.cargo/bin:$PATH"

# Android
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"

# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
