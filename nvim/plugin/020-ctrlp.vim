" ctrlp
" -----

if exists("g:ctrl_user_command")
    unlet g:ctrlp_user_command
endif

" color to highlight matching segments of the path
hi CtrlPMatch guifg=#afd787

let g:ctrlp_mruf_exclude='/private/*'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](' . join([
    \ '\.cabal-sandbox',
    \ '\.cache',
    \ '\.detox-artifacts',
    \ '\.git',
    \ '\.stack-work',
    \ '\.svn',
    \ '\.temp',
    \ '\.xcodeproj',
    \ 'allure-results',
    \ 'artifacts',
    \ 'assets',
    \ 'bin',
    \ 'build',
    \ 'cmake-build-debug',
    \ 'CMakeFiles',
    \ 'coverage',
    \ 'dist',
    \ 'docs',
    \ 'gradle',
    \ 'node_modules',
    \ 'obj',
    \ 'plugged',
    \ 'swaps',
    \ 'site-packages',
    \ 'target',
    \ 'undo',
    \ 'venv',
    \ 'yesod-devel',
  \ ], '|') . ')$',
  \ 'file': '\v(' . join([
    \ 'compile_commands.json',
    \ '\.d',
    \ '\.DS_Store',
    \ '\.o',
    \ '\.out',
    \ '\.plist',
    \ '\.pyc',
    \ '\.pyo',
    \ '\.rar',
    \ '\.xcconfig',
    \ '\.zip',
    \ 'tags\.lock',
    \ 'tags\.temp',
  \ ], '|') . ')$',
  \ }

" When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'

" CtrlP root markers
let g:ctrlp_root_markers = ['.ctrlp']

" Show hidden files
let g:ctrlp_show_hidden = 1

" search by filename (use Ctrl-D to search by fill path instead)
let g:ctrlp_by_filename = 1

let g:ctrlp_status_func = { 'main': 'CtrlPStatusLine' }

" Main statusline
fun! CtrlPStatusLine(...)
  let regex = a:3 ? '%#LineNr# regex %*' : ''
  let item = ' %#Character# ' . a:5 . ' %*'
  let dir = ' %=%<%#LineNr# ' . getcwd() . ' %*'
  retu regex.item.dir
endf

command CtrlPRefresh CtrlPClearCache
