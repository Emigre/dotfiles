export PATH="/usr/local/bin:$HOME/.node/bin:$HOME/.jenv/bin:$PATH"
alias npml='npm list --depth=0'
alias npmlg='npm list -g --depth=0'
alias bowerl='bower list | grep '"'"'^├\|^└'"'"''
alias bowerlg='bower list -g | grep '"'"'^├\|^└'"'"''
alias tree='tree -C'
alias python='python3'
alias pip='pip3'
alias http='/usr/local/bin/http --pretty=all --verbose'
alias httpa='http --session=s'
alias zoom='open ~/Applications/Zoom.app'
alias less='/usr/bin/less -R'

# Java
eval "$(jenv init -)"
export JAVA_HOME=$(/usr/libexec/java_home)

if [ "$HOSTNAME" = "bb-system-0322.local" ]; then
  export JAVA_OPTS='-Xms128m -Xmx768m -XX:MaxPermSize=512m'
  export M2_HOME='/usr/local/Cellar/maven31/3.1.1/libexec'
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
