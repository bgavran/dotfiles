# Aliases
alias vi="$EDITOR"
alias vim="$EDITOR"
alias sudo='sudo '  # So I can use aliases with sudo
alias ptp="ptpython"
alias r="ranger"
alias -g G="|grep --color -i"
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'

# Save a longer history of commands
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Set vi style editing
bindkey -v

# Extended pattern matching
setopt extendedglob

## Set up oh-my-zsh stuff
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="agnoster"

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
  git cabal colored-man-pages vi-mode
)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Source fzf stuff
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Enabling conda
. /opt/anaconda/etc/profile.d/conda.sh

#############################################
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bgavran/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
