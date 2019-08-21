alias gcal='gcalcli --nocolor '
alias grep='grep -I --exclude-dir={\.git,node_modules,build,target,dist,bin}'
alias joplin='joplin;clear'
alias k='kubectl'
alias less='less -R '
alias mutt="pushd $HOME/Desktop 1>/dev/null;neomutt;popd 1>/dev/null"
alias ranger="python3 $HOME/ranger/ranger.py"
alias tree='tree -I "node_modules|build|target|dist|bin"'
alias vi='nvim'
alias vim='nvim'

alias evernote='open /Applications/Evernote.app'
alias itunes='open /Applications/iTunes.app'
alias steam='open /Applications/Steam.app'

export EDITOR='nvim'

if ! [ -n "$TMUX" ]; then
  export PATH=$PATH:"$HOME/.local/bin"
fi

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
if ! [ -n "$TMUX" ]; then
  export PATH=$PATH:"$HOME/scripts"
fi

# C++
alias clang_include_paths='clang -E -Wp,-v -xc++ /dev/null 2>&1 | grep "^\s*\/" | sed "s/^ *//"'
alias clang_search_paths='clang -Xlinker -v 2>&1 | grep "^\s*\/" | sed -E $"s/^[^\/]*//"'
alias sdk_path='xcrun --show-sdk-path'
alias toolchain_path="echo `xcode-select -print-path`/Toolchains/XcodeDefault.xctoolchain"
export OF_ROOT="$HOME/code/cpp/openFrameworks"

# Java
alias java_home='/usr/libexec/java_home'
export JAVA_HOME='/Library/Java/JavaVirtualMachines/openjdk-11.0.2.jdk/Contents/Home'
if ! [ -n "$TMUX" ]; then
  export PATH=$PATH:"$JAVA_HOME/bin"
fi
export GRADLE_USER_HOME="$HOME/.gradle"
export MAVEN_OPTS="-Xms256m -Xmx512m"
export M2_HOME='/usr/local/Cellar/maven/3.5.4/libexec'
export M2="$M2_HOME/bin"
if ! [ -n "$TMUX" ]; then
  export PATH=$PATH:$M2
fi
export JDK_HOME=${JAVA_HOME}
if ! [ -n "$TMUX" ]; then
  export PATH=$PATH:"$ANDROID_HOME/emulator"
  export PATH=$PATH:"$ANDROID_HOME/tools"
  export PATH=$PATH:"$ANDROID_HOME/tools/bin"
  export PATH=$PATH:"$ANDROID_HOME/platform-tools"
fi

# Javascript
alias npml='npm list --depth=0'
alias npmlg='npm list -g --depth=0'
if ! [ -n "$TMUX" ]; then
  export PATH=$PATH:"$HOME/.node/bin"
  export PATH=$PATH:"$HOME/.yarn/bin"
fi

# Python
export PIP_CONFIG_FILE="$HOME/.pip_conf"

# PostgreSQL
alias psql_start='pg_ctl -l /usr/local/var/postgres/server.log start'
alias psql_stop='pg_ctl stop -m fast'
alias psql_status='pg_ctl status | egrep pg_ctl'
alias psql_reload='pg_ctl reload'
alias psql_port="egrep -o '#listen_addresses\s*=\s*\S+|#port\s*=\s*[0-9]+' /usr/local/var/postgres/postgresql.conf | sed -e s/^#[a-zA-Z_]*\ *=\ *\'*//g | sed -e s/\'*$//g | xargs -n2"
export PGDATA='/usr/local/var/postgres'

# MongoDB
if ! [ -n "$TMUX" ]; then
  export PATH=$PATH:"/usr/local/opt/mongodb-community@3.6/bin"
fi
alias mongo_start='mongod --fork --config /usr/local/etc/mongod.conf'

# Kubernetes
export KUBECONFIG="$HOME/.kube/wd-audio-platform-admin-dev.kubeconfig"

# AWS
export AWS_SDK_LOAD_CONFIG="true"
# export AWS_DEFAULT_PROFILE=...

# Terraform
# export AWS_PROFILE=...
