let g:ale_sign_error = '░ '
let g:ale_sign_warning = '░ '

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0

hi! link ALEError SpellBad
hi! ALEWarning ctermfg=NONE
hi! link ALEErrorSign SpellBad
hi! link ALEWarningSign SpellRare

nmap <silent> ' <Plug>(ale_next_wrap)

let g:ale_linters = {
\ 'jsx': ['eslint'],
\ 'java': ['checkstyle'],
\ 'haskell': ['hlint'],
\}

let g:ale_lint_on_text_changed = 'never'

let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
