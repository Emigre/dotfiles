let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 1

let g:ale_sign_error = '░ '
let g:ale_sign_warning = '░ '
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'

hi! link ALEError SpellBad
hi! ALEWarning ctermfg=NONE
hi! link ALEErrorSign SpellBad
hi! link ALEWarningSign SpellRare

nmap <silent> \| <Plug>(ale_previous_wrap)
nmap <silent> \ <Plug>(ale_next_wrap)

let g:ale_linters = {
      \ 'c': ['cpplint'],
      \ 'clojure': ['joker'],
      \ 'cpp': ['cpplint'],
      \ 'go': ['golint'],
      \ 'java': ['checkstyle'],
      \ 'javascript': ['eslint'],
      \ 'jsx': ['eslint'],
      \ 'python': ['flake8', 'pylint'],
      \ 'rust': ['cargo'],
      \ 'typescript': ['tslint'],
      \}

let g:ale_cpp_cpplint_options = '--filter=-legal/copyright,-build/include_subdir'

let g:ale_java_javac_classpath = './src/main/java/'
let g:ale_java_javac_options = ''

let g:ale_python_pylint_options = '--disable=' .
      \ 'missing-docstring,' .
      \ 'too-few-public-methods,' .
      \ 'invalid-name,' .
      \ 'no-self-use'
