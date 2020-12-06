alias grep='grep -I --exclude-dir={\.git,node_modules,build,target,dist,bin}'
alias less='less -R '
alias tree='tree -I "node_modules|build|target|dist|bin"'

alias vi="XDG_CONFIG_HOME=$HOME/vim/config nvim"
alias vim="XDG_CONFIG_HOME=$HOME/vim/config nvim"
alias nvim="XDG_CONFIG_HOME=$HOME/vim/config nvim"

alias hexedit='hexedit --color'

alias cm='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1'

alias tsx='npx tsc -p tsconfig.json --pretty'
alias tst='npx jest'

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
