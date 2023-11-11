# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

#export LANG="en_US.UTF-8"
#export LANGUAGE="en_US.utf8"
#export LC_ALL="en_US.utf8"
export TERM=xterm-256color

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Default programs:
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=/usr/bin/brave-browser
export FILE=thunar
export PAGER="less"

# iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# less pager
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"

# FZF
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 100% --border' 

# NVIM
export MYVIMRC="$HOME/.config/nvim/init.lua"

# Openvpn
export VPN="$HOME/.config/vpn"

# Zsh
export ZDOTDIR="$HOME/.config/zsh"
export _Z_DATA="$ZDOTDIR/.z"

# ASDF build erland doc
# https://mrdotb.com/tils/asdf-elixir-get-erlang-doc/
export KERL_BUILD_DOCS=yes

# Android
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
export PATH="$HOME/Android/Sdk/tools/bin:$PATH"
export PATH="$HOME/Android/Sdk/tools:$PATH"
export PATH="$HOME/Android/Sdk/cmdline-tools/latest/bin:$PATH"
export PATH="$HOME/Android/Sdk/emulator:$PATH"

# Cargo
. "$HOME/.cargo/env"

# Pass
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# openai
export OPENAI_API_KEY=$(cat $HOME/.config/.open_ai_key)

# Age
export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
