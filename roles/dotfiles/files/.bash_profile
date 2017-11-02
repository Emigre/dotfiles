export PATH="/usr/local/bin:$PATH"

[ "$(scutil --get ComputerName)" == "Gaspar’s MacBook Pro" ] && IS_HOME=true || IS_HOME=false

# aliases
alias tree="tree -C -I 'node_modules|bower_components'"
if [ $IS_HOME == true ]; then
  alias zoom="open $HOME/Applications/Zoom.app"
fi
alias simulator='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'
alias vi='vim'
alias eclim='/Applications/Eclipse.app/Contents/Eclipse/eclimd'
alias flow_watch='flow status; fswatch -e "/\." -o . | xargs -n1 -I{} flow status'
alias less='less -R '

# Httpie
alias h='http-prompt'
alias http='/usr/local/bin/http --pretty=all --verify=no --verbose'

# entr
function e() {
  if [[ $# -eq 0 ]] ; then
    entr
  else
    while true; do
      ag -l | entr -c -d $@
    done
  fi
}

# Node
if [ $IS_HOME == true ] ; then
  export PATH="$HOME/.node/bin:$PATH"
fi
export PATH="$PATH:$HOME/.yarn/bin"
alias npml='npm list --depth=0'
alias npmlg='npm list -g --depth=0'
alias bowerl='bower list | grep '"'"'^├\|^└'"'"''

# Python
export PATH="$HOME/Library/Python/3.4/bin:$PATH"

# Scheme
alias scheme='rlwrap mit-scheme'

# Go
export GOPATH=$HOME/Code/Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# Haskell
export PATH=$PATH:"$HOME/.cabal/bin"
export PATH=$PATH:"$HOME/.local/bin"

# Java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export JAVA_HOME=$(/usr/libexec/java_home)
export M2_HOME='/usr/local/Cellar/maven/3.3.3/libexec'
export M2=$M2_HOME/bin
export GRADLE_USER_HOME="$HOME/.gradle"

# PostgreSQL
export PGDATA='/usr/local/var/postgres'
alias psql_start='pg_ctl -l /usr/local/var/postgres/server.log start'
alias psql_stop='pg_ctl stop -m fast'
alias psql_status='pg_ctl status | egrep pg_ctl'
alias psql_reload='pg_ctl reload'
alias psql_port="egrep -o '#listen_addresses\s*=\s*\S+|#port\s*=\s*[0-9]+' /usr/local/var/postgres/postgresql.conf | sed -e s/^#[a-zA-Z_]*\ *=\ *\'*//g | sed -e s/\'*$//g | xargs -n2"

# depot tools
export PATH="$HOME/Code/depot_tools:$PATH"

# git completion
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
[ -f "$HOME/.git-completion.bash" ] && source "$HOME/.git-completion.bash"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Ensure the xterm ctrl-arrow combinations function
bind '"\e[1;5C": forward-word'
bind '"\e[1;5D": backward-word'

# do not disturb terminal with ctrl-S or ctrl-Q
stty -ixon
