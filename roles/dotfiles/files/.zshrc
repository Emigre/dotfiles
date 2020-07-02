alias grep='grep -I --exclude-dir={\.git,node_modules,build,target,dist,bin}'
alias less='less -R '
alias tree='tree -I "node_modules|build|target|dist|bin"'

alias vi="XDG_CONFIG_HOME=$HOME/vim nvim"
alias vim="XDG_CONFIG_HOME=$HOME/vim nvim"
alias nvim="XDG_CONFIG_HOME=$HOME/vim nvim"
alias n="NAVI_PATH=$HOME/vim/navi/cheats $HOME/vim/navi/navi"
alias ranger="python3 $HOME/vim/ranger/ranger.py"

alias tscheck='npx tsc -p tsconfig.json --pretty'

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
