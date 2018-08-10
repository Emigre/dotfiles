[ "$(scutil --get ComputerName)" == "Gaspar’s MacBook Pro" ] && IS_HOME=true || IS_HOME=false

alias grep="grep -I --exclude-dir={\.git,node_modules,build,target,dist,bin}"
alias less='less -R '
alias tree="tree -I 'node_modules|build|target|dist|bin'"
alias vi="vim"

# C++
alias depot_tools_start='export PATH="$HOME/depot_tools:$PATH"'
alias cmake='cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1'
alias of='make RunRelease'
export OF_ROOT="$HOME/code/c++/of/openFrameworks"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home"
export GRADLE_USER_HOME="$HOME/.gradle"
export M2_HOME='/usr/local/Cellar/maven/3.5.4/libexec'
export M2=$M2_HOME/bin

# Rust
export PATH=$PATH:"$HOME/.cargo/bin"

# Go
export GOPATH=$HOME/code/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# Javascript
if [ $IS_HOME == true ] ; then
  export PATH="$PATH:$HOME/.node/bin"
fi
export PATH="$PATH:$HOME/.yarn/bin"
alias npml='npm list --depth=0'
alias npmlg='npm list -g --depth=0'
alias flow_watch='flow status; fswatch -e "/\." -o . | xargs -n1 -I{} flow status'

# Python
export PIP_CONFIG_FILE="$HOME/.pip_conf"
alias python='python3'
alias pip='pip3'

# Haskell
export PATH=$PATH:"$HOME/.cabal/bin"
export PATH=$PATH:"$HOME/.local/bin"

# Pascal
alias fpc='MACOSX_DEPLOYMENT_TARGET=10.12 fpc'

# PostgreSQL
export PGDATA='/usr/local/var/postgres'
alias psql_start='pg_ctl -l /usr/local/var/postgres/server.log start'
alias psql_stop='pg_ctl stop -m fast'
alias psql_status='pg_ctl status | egrep pg_ctl'
alias psql_reload='pg_ctl reload'
alias psql_port="egrep -o '#listen_addresses\s*=\s*\S+|#port\s*=\s*[0-9]+' /usr/local/var/postgres/postgresql.conf | sed -e s/^#[a-zA-Z_]*\ *=\ *\'*//g | sed -e s/\'*$//g | xargs -n2"

# Ensure the xterm ctrl-arrow combinations function
bind '"\e[1;5C": forward-word'
bind '"\e[1;5D": backward-word'

# Do not disturb terminal with ctrl-S or ctrl-Q
stty -ixon

# Bash completion
for bcfile in ~/.bash_completion.d/* ; do
  [ -f "$bcfile" ] && . $bcfile
done

# Utility scripts
export PATH=$PATH:"$HOME/scripts"