export PATH="$HOME/Code/depot_tools:/usr/local/bin:$PATH"
alias ag='ag --path-to-agignore ~/.agignore'
alias tree="tree -C -I 'node_modules|bower_components'"
alias less='/usr/bin/less -r'
alias http='/usr/local/bin/http --pretty=all --verbose'
alias httpa='http --session=s'
alias ts='tree -L 3 | less'
alias zoom="open $HOME/Applications/Zoom.app"

# Node
export PATH="$HOME/.node/bin:$PATH"
alias npml='npm list --depth=0'
alias npmlg='npm list -g --depth=0'
alias bowerl='bower list | grep '"'"'^├\|^└'"'"''

# Python
alias python='python3'
alias pip='pip3'

# Go
export GOPATH=$HOME/Code/Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# Java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export JAVA_HOME=$(/usr/libexec/java_home)

if [ "$(scutil --get ComputerName)" = "Gaspar’s MacBook Pro" ]; then
  export M2_HOME='/usr/local/Cellar/maven/3.3.3/libexec'
  export M2=$M2_HOME/bin
fi

if [ "$(scutil --get ComputerName)" = "bb-system-0322" ]; then
  export JAVA_OPTS='-Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC'
  export M2_HOME='/usr/local/Cellar/maven/3.3.3/libexec'
  export M2=$M2_HOME/bin
  export MAVEN_OPTS=$JAVA_OPTS
fi

# PostgreSQL
export PGDATA='/usr/local/var/postgres'
alias pg_start='pg_ctl -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl stop -m fast'
alias pg_status='pg_ctl status'
alias pg_reload='pg_ctl reload'

# git completion
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
