let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 1
let g:ale_sign_error = '░ '
let g:ale_sign_warning = '░ '
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '%s [%linter%]'
let g:ale_linters_explicit = 1

hi! link ALEError SpellBad
hi! ALEWarning ctermfg=NONE
hi! link ALEErrorSign SpellBad
hi! link ALEWarningSign SpellRare

nmap <silent> \| <Plug>(ale_previous_wrap)
nmap <silent> \ <Plug>(ale_next_wrap)

let g:ale_linters = {
      \ 'c': ['clangtidy'],
      \ 'cpp': ['clangtidy'],
      \ 'java': ['checkstyle'],
      \ 'javascript': ['eslint'],
      \ 'python': ['flake8', 'pylint'],
      \ 'rust': ['cargo'],
      \ 'typescript': ['tslint'],
      \ }

let g:ale_fixers = {
      \ 'css': ['prettier'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'python': ['autopep8'],
      \ 'typescript': ['prettier', 'tslint'],
      \ }

" disable ale outside the code folder and in the openFrameworks folder
let g:ale_pattern_options = {
      \ '^\(/Users/[^/]\+/code/\)\@!\|\(/Users/[^/]\+/code/openFrameworks\)':
      \   { 'ale_linters': [], 'ale_fixers': [] },
      \ }
let g:ale_pattern_options_enabled = 1

let g:ale_javascript_prettier_options = '' .
      \ '--single-quote ' .
      \ '--print-width 100 ' .
      \ '--trailing-comma all'

" https://clang.llvm.org/extra/clang-tidy/index.html
" http://clang.llvm.org/extra/clang-tidy/checks/list.html
let g:ale_cpp_clangtidy_checks = [
      \ '-*',
      \ '-abseil-*',
      \ '-android-*',
      \ 'boost-*',
      \ 'bugprone-*',
      \ 'cert-*',
      \ 'cppcoreguidelines-*',
      \ '-clang-analyzer-*',
      \ '-fuchsia-*',
      \ 'google-*',
      \ '-hicpp-*',
      \ '-llvm-*',
      \ 'misc-*',
      \ 'modernize-*',
      \ 'mpi-*',
      \ '-objc-*',
      \ 'performance-*',
      \ 'portability-*',
      \ 'readability-*',
      \ '-zircon-*',
      \ ]

let g:ale_cpp_clangtidy_executable = '/usr/local/opt/llvm/bin/clang-tidy'

let g:ale_java_javac_classpath = './src/main/java/'

let g:ale_java_javac_options = ''

let g:ale_python_pylint_options = '' .
      \ '--disable=missing-docstring,' .
      \ 'too-few-public-methods,' .
      \ 'invalid-name,' .
      \ 'no-self-use'
