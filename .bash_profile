# https://docs.npmjs.com/getting-started/fixing-npm-permissions
# - To configure the .node folder in ~ add this to the .npmrc file:
# echo prefix=~/.node >> ~/.npmrc
# - And change the owner of these folders:
# sudo chown -R `whoami` ~/.node
# sudo chown -R `whoami` ~/.npm
export PATH="/usr/local/bin:$HOME/.node/bin:$PATH"
alias npml='npm list --depth=0'
alias npmlg='npm list -g --depth=0'
alias tree='tree -C'
alias python='python3'
alias pip='pip3'
alias httpa='http -v --session=a'
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
