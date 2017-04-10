let g:ale_sign_error = '░ '
let g:ale_sign_warning = '░ '

hi! link ALEErrorSign SpellBad
hi! link ALEWarningSign SpellRare

nmap <silent> ' <Plug>(ale_previous_wrap)
nmap <silent> ; <Plug>(ale_next_wrap)

let g:ale_linters = {'jsx': ['eslint']}

let g:ale_lint_on_text_changed = 'never'

let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
