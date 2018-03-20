# Uses entr to run commands on file changes
function watch_changes() {
  local ag_path=""
  if [[ `basename "$PWD"` == 'build' ]]; then
    ag_path=".."
  fi

  if [[ $# -eq 0 ]] ; then
    entr
  else
    while true; do
      ag -l . $ag_path | entr -c -d -s "$@"
    done
  fi
}
