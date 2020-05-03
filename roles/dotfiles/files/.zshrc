alias grep='grep -I --exclude-dir={\.git,node_modules,build,target,dist,bin}'
alias less='less -R '
alias n="$HOME/navi/navi"
alias tree='tree -I "node_modules|build|target|dist|bin"'
alias vi='nvim'
alias vim='nvim'

# Ensure the xterm ctrl-arrow combinations function
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

# Ensure alt-arrow combinations work
bindkey "\e[1;3C" forward-word
bindkey "\e[1;3D" backward-word

# Enable completion
autoload -Uz compinit

if ! [ -n "$TMUX" ]; then
  typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
  if [ $(date +'%j') != $updated_at ]; then
    compinit
  else
    compinit -C
  fi
else
  compinit -C
fi
