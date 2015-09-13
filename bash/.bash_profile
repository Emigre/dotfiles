export PATH="/usr/local/bin:$HOME/.node/bin:$PATH"
alias npml='npm list --depth=0'
alias npmlg='npm list -g --depth=0'
alias bowerl='bower list | grep '"'"'^├\|^└'"'"''
alias bowerlg='bower list -g | grep '"'"'^├\|^└'"'"''
alias tree='tree -C'
alias python='python3'
alias pip='pip3'
alias httpa='http -v --session=s'
alias zoom='open ~/Applications/Zoom.app'
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
