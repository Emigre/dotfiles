[ "$(scutil --get ComputerName)" == 'Gaspar’s MacBook Pro' ] && IS_HOME=true || IS_HOME=false

alias gcal='gcalcli'
alias grep='grep -I --exclude-dir={\.git,node_modules,build,target,dist,bin}'
alias less='less -R '
alias mutt="pushd $HOME/Desktop 1>/dev/null;neomutt;popd 1>/dev/null"
alias tree='tree -I "node_modules|build|target|dist|bin"'
alias vi='nvim'
alias vim='nvim'

alias evernote='open /Applications/Evernote.app'
alias itunes='open /Applications/iTunes.app'
alias steam='open /Applications/Steam.app'

export EDITOR='nvim'

# C++
alias depot_tools_start='export PATH="$HOME/depot_tools:$PATH"'
alias clang_include_paths='clang -E -Wp,-v -xc++ /dev/null 2>&1 | grep "^\s*\/" | sed "s/^ *//"'
alias clang_search_paths='clang -Xlinker -v 2>&1 | grep "^\s*\/" | sed -E $"s/^[^\/]*//"'
alias sdk_path='xcrun --show-sdk-path'
alias toolchain_path="echo `xcode-select -print-path`/Toolchains/XcodeDefault.xctoolchain"
alias of='make RunRelease'
export OF_ROOT="$HOME/code/openframeworks"

# Go
export GOPATH=$HOME/code/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# Java
alias java_home='/usr/libexec/java_home'
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home'
export GRADLE_USER_HOME="$HOME/.gradle"
export M2_HOME='/usr/local/Cellar/maven/3.5.4/libexec'
export M2="$M2_HOME/bin"

# Javascript
alias npml='npm list --depth=0'
alias npmlg='npm list -g --depth=0'
alias flow_watch='flow status; fswatch -e "/\." -o . | xargs -n1 -I{} flow status'
export PATH="$PATH:$HOME/.node/bin"
export PATH="$PATH:$HOME/.yarn/bin"

# Python
alias python='python3'
alias pip='pip3'
export PIP_CONFIG_FILE="$HOME/.pip_conf"

# Rust
export PATH=$PATH:"$HOME/.cargo/bin"

# PostgreSQL
alias psql_start='pg_ctl -l /usr/local/var/postgres/server.log start'
alias psql_stop='pg_ctl stop -m fast'
alias psql_status='pg_ctl status | egrep pg_ctl'
alias psql_reload='pg_ctl reload'
alias psql_port="egrep -o '#listen_addresses\s*=\s*\S+|#port\s*=\s*[0-9]+' /usr/local/var/postgres/postgresql.conf | sed -e s/^#[a-zA-Z_]*\ *=\ *\'*//g | sed -e s/\'*$//g | xargs -n2"
export PGDATA='/usr/local/var/postgres'

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
