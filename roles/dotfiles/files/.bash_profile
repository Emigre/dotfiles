[ "$(scutil --get ComputerName)" == "Gaspar’s MacBook Pro" ] && IS_HOME=true || IS_HOME=false

alias la="ls -la"
alias less='less -R '
alias tree="tree -I 'node_modules|build|target|dist|bin'"
alias grep="grep -I --exclude-dir={\.git,node_modules,build,target,dist,bin}"
alias vim="/usr/local/bin/vim"
alias vi="/usr/local/bin/vim"

# C++
alias of_run='make RunRelease'
alias depot_tools_start='export PATH="$HOME/Code/c++/depot_tools:$PATH"'
export OF_ROOT="$HOME/code/c++/of/openFrameworks"

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

# Java
if [ $IS_HOME == true ] ; then
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home"
else
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home"
fi
export GRADLE_USER_HOME="$HOME/.gradle"
export M2_HOME='/usr/local/Cellar/maven/3.3.3/libexec'
export M2=$M2_HOME/bin

# Scheme
alias scheme='rlwrap mit-scheme'

# Go
export GOPATH=$HOME/Code/Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# Httpie
alias h='http-prompt'
alias http='/usr/local/bin/http --pretty=all --verify=no --verbose'

# PostgreSQL
export PGDATA='/usr/local/var/postgres'
alias psql_start='pg_ctl -l /usr/local/var/postgres/server.log start'
alias psql_stop='pg_ctl stop -m fast'
alias psql_status='pg_ctl status | egrep pg_ctl'
alias psql_reload='pg_ctl reload'
alias psql_port="egrep -o '#listen_addresses\s*=\s*\S+|#port\s*=\s*[0-9]+' /usr/local/var/postgres/postgresql.conf | sed -e s/^#[a-zA-Z_]*\ *=\ *\'*//g | sed -e s/\'*$//g | xargs -n2"

# Git completion
[ -f "$HOME/scripts/git_completion.bash" ] && source "$HOME/scripts/git_completion.bash"

# `filewatch` runs a command on files changes
[ -f "$HOME/scripts/watch_changes.bash" ] && source "$HOME/scripts/watch_changes.bash"

# `autostart` creates files and folders for an Autotools project
[ -f "$HOME/scripts/autotools_start.bash" ] && source "$HOME/scripts/autotools_start.bash"

# `cmakestart` creates files and folders for a CMake project
[ -f "$HOME/scripts/cmake_start.bash" ] && source "$HOME/scripts/cmake_start.bash"

# `cm` runs CMake in a build folder
[ -f "$HOME/scripts/cmake_build.bash" ] && source "$HOME/scripts/cmake_build.bash"

# `run` builds a CMake folder and watch for source code changes
[ -f "$HOME/scripts/run.bash" ] && source "$HOME/scripts/run.bash"

# Ensure the xterm ctrl-arrow combinations function
bind '"\e[1;5C": forward-word'
bind '"\e[1;5D": backward-word'

# do not disturb terminal with ctrl-S or ctrl-Q
stty -ixon
