[[ -f ~/.bashrc ]] && . ~/.bashrc

export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"

export PATH="/home/bgavran/.local/bin:$PATH"
export PATH="/home/bgavran/.cabal/bin:$PATH"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
