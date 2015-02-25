# https://docs.npmjs.com/getting-started/fixing-npm-permissions
# - To configure the .node folder in ~ add this to the .npmrc file:
# echo prefix=~/.node >> ~/.npmrc
# - And change the owner of these folders:
# sudo chown -R `whoami` ~/.node
# sudo chown -R `whoami` ~/.npm
export PATH="/usr/local/bin:$HOME/.node/bin:$PATH"
alias vim='mvim'
alias npml='npm list --depth=0'
alias npmlg='npm list -g --depth=0'
alias python='python3'
alias pip='pip3'
alias httpa='http -v --session=a'
# PostgreSQL
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -m fast'
alias pg-status='pg_ctl status'
alias pg-restart='pg_ctl reload'
