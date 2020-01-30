alias csi='rlwrap csi'
alias gcal='gcalcli --nocolor '
alias grep='grep -I --exclude-dir={\.git,node_modules,build,target,dist,bin}'
alias joplin='joplin;clear'
alias k='kubectl'
alias less='less -R '
alias mutt="pushd $HOME/Desktop 1>/dev/null;neomutt;popd 1>/dev/null"
alias n="$HOME/navi/navi"
alias ranger="python3 $HOME/ranger/ranger.py"
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
