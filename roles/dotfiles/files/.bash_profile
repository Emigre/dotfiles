export PATH="/usr/local/bin:$PATH"

[ "$(scutil --get ComputerName)" == "Gaspar’s MacBook Pro" ] && IS_HOME=true || IS_HOME=false

if [ $IS_HOME == false ] ; then
  export proxy=http://surf-proxy.intranet.db.com:8080
  export https_proxy=https://surf-proxy.gslb.db.com:8080
fi

# aliases
alias ag='ag --path-to-agignore ~/.agignore'
alias tree="tree -C -I 'node_modules|bower_components'"
alias less='/usr/bin/less -r'
alias http='/usr/local/bin/http --pretty=all --verbose'
alias httpa='http --session=s'
alias ts='tree -L 3 | less'
if [ $IS_HOME == true ]; then
  alias zoom="open $HOME/Applications/Zoom.app"
fi

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
alias python='python3'
alias pip='pip3'

# Scheme
alias scheme='rlwrap mit-scheme'

# Go
export GOPATH=$HOME/Code/Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# Haskell
export PATH=$PATH:"$HOME/.cabal/bin"

# Java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export JAVA_HOME=$(/usr/libexec/java_home)
export M2_HOME='/usr/local/Cellar/maven/3.3.3/libexec'
export M2=$M2_HOME/bin

# PostgreSQL
export PGDATA='/usr/local/var/postgres'
alias pg_start='pg_ctl -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl stop -m fast'
alias pg_status='pg_ctl status'
alias pg_reload='pg_ctl reload'

# depot tools
export PATH="$HOME/Code/depot_tools:$PATH"

# git completion
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
[ -f "$HOME/.git-completion.bash" ] && source "$HOME/.git-completion.bash"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
