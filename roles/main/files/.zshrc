alias gcal='gcalcli --nocolor '
alias grep='grep -I --exclude-dir={\.git,node_modules,build,target,dist,bin}'
alias joplin='joplin;clear'
alias k='kubectl'
alias less='less -R '
alias mutt="pushd $HOME/Desktop 1>/dev/null;neomutt;popd 1>/dev/null"
alias n="$HOME/navi/navi"
alias nv="$HOME/.node/bin/n"
alias ranger="python3 $HOME/ranger/ranger.py"
alias tree='tree -I "node_modules|build|target|dist|bin"'
alias vi='nvim'
alias vim='nvim'

# Ensure the xterm ctrl-arrow combinations function
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

# Enable completion
autoload -Uz compinit && compinit
