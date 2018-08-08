# A .h_config file should be in the home folder with the different APIs listed in this format:
# <name> <api_url> [--spec <swagger_url>]
# Example:
# github https://api.github.com --spec https://api.apis.guru/v2/specs/github.com/v3/swagger.json

_http_prompt() {
  if [ -f $HOME/.h_config ]; then
    if [ $COMP_CWORD -eq 1 ]; then
      cur_word=${COMP_WORDS[COMP_CWORD]}
      comp_options=`cat $HOME/.h_config | awk '{ print $1 }' | tr '\n' ' '`
      COMPREPLY=( $(compgen -W "${comp_options}" -- ${cur_word}) )
    else
      # do not autocomplete parameters other than the first one
      COMPREPLY=()
    fi
  fi
  return 0
}

complete -F _http_prompt h
complete -F _http_prompt h_init
