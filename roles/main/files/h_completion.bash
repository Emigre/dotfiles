_http_prompt() {
  if [ -f $HOME/.h_config ]; then
    cur_word=${COMP_WORDS[COMP_CWORD]}
    comp_options=`cat $HOME/.h_config | awk '{ print $1 }' | tr '\n' ' '`
    COMPREPLY=( $(compgen -W "${comp_options}" -- ${cur_word}) )
  fi
  return 0
}

complete -F _http_prompt h
