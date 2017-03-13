POWERLEVEL9K_INSTALLATION_PATH="$HOME/.zim/modules/prompt/external-themes/powerlevel9k/powerlevel9k.zsh-theme"
POWERLEVEL9K_MODE="awesome-fontconfig"

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode anaconda)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)

POWERLEVEL9K_STATUS_VERBOSE="false"
POWERLEVEL9K_VI_INSERT_MODE_STRING="INSERT"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="NORMAL"

POWERLEVEL9K_ANACONDA_BACKGROUND="blue"
POWERLEVEL9K_ANACONDA_FOREGROUND="black"
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER=""
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=""
# POWERLEVEL9K_PYTHON_ICON=""
POWERLEVEL9K_PYTHON_ICON=""

export KEYTIMEOUT=1

# Fix for the oh-my-zsh broken vi mode
function zle-line-init {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-line-finish {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-keymap-select {
  powerlevel9k_prepare_prompts
  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N ale-line-finish
zle -N zle-keymap-select

# End for the fix



#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Vim style editing
bindkey -v
bindkey "^W" backward-kill-word    # vi-backward-kill-word
bindkey "^H" backward-delete-char  # vi-backward-delete-char
bindkey "^U" kill-line             # vi-kill-line
bindkey "^?" backward-delete-char  # vi-backward-delete-char
# End of vim style editing


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /etc/profile.d/autojump.zsh
source "$HOME/build/alias-tips/alias-tips.plugin.zsh" # Reminding me every time I don't use an alias
source "$HOME/build/archlinux-plugin-zsh/archlinux.plugin.zsh" # Useful archlinux aliases from omz
source "$HOME/build/omz-git-aliases/git.aliases.zsh" # Useful git aliases from omz
source "$HOME/build/omz-git-aliases/directories.zsh" # Useful directory aliases from omz

export PATH="/opt/anaconda/bin:$PATH"
export PATH="/home/bgavran3/.gem/ruby/2.4.0/bin:$PATH"
export EDITOR="vim"

alias ot="xdg-open"
alias t="tyls"
alias tl="tyls -a"
alias bp="bpython"
alias r="ranger"
alias -g G="|grep --color -i"
alias pls='sudo $(fc -ln -1)'
