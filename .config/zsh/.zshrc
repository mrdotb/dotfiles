# mrdotb's config for the Z Shell

autoload -U colors && colors

# Load promptline
# [ -f "$ZDOTDIR/.promptline.sh" ] && source "$ZDOTDIR/.promptline.sh"

# Load starship
eval "$(starship init zsh)"

# Load zsh autosuggestion
[ -f "$ZDOTDIR/zsh-autosuggestion/zsh-autosuggestions.zsh" ] && source "$ZDOTDIR/zsh-autosuggestion/zsh-autosuggestions.zsh"

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load z
[ -f "$ZDOTDIR/z.sh" ] && source "$ZDOTDIR/z.sh"

# fzf shortcuts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
[ -s "$HOME/.asdf/asdf.sh" ] && \. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

# docker
fpath=(${ZDOTDIR}/completions $fpath)

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# Helpers functions

function temp() {
  vim +"set filetype=$1" /tmp/temp-$(date +'%Y%m%d-%H%M%S')
}

function git_branch {
  git rev-parse --abbrev-ref HEAD
}

function git_checkout {
  git checkout $(git for-each-ref --sort=-creatordate --format '%(refname:short)' refs/heads | fzf)
}

function ksecret {
  if [ $# -lt 2 ]; then
    echo "Usage: ksecret namespace secret"
    return 1
  fi

  kubectl get secret -n $1 $2 -o json | jq '.data | map_values(@base64d)'
}

# Unlimited history
# https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh
HISTFILE="$HOME/.config/zsh/.zsh_history"
HISTSIZE=99999999
SAVEHIST=99999999
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# pnpm
export PNPM_HOME="/home/john/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
