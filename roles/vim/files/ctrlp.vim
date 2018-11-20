if exists("g:ctrl_user_command")
    unlet g:ctrlp_user_command
endif

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](' . join([
    \ '\.cabal-sandbox',
    \ '\.cache',
    \ '\.git',
    \ '\.stack-work',
    \ '\.temp',
    \ '\.xcodeproj',
    \ 'android',
    \ 'assets',
    \ 'bin',
    \ 'build',
    \ 'cmake-build-debug',
    \ 'CMakeFiles',
    \ 'coverage',
    \ 'dist',
    \ 'gradle',
    \ 'ios',
    \ 'node_modules',
    \ 'obj',
    \ 'target',
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
    \ '\.rar',
    \ '\.xcconfig',
    \ '\.zip',
    \ 'tags\.lock',
    \ 'tags\.temp',
  \ ], '|') . ')$',
  \ }

" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'

" CtrlP root markers
let g:ctrlp_root_markers = ['.ctrlp']

" Show hidden files
let g:ctrlp_show_hidden = 1

let g:ctrlp_status_func = { 'main': 'CtrlPStatusLine' }

" Main statusline
fun! CtrlPStatusLine(...)
  let regex = a:3 ? '%#LineNr# regex %*' : ''
  let item = ' %#Character# ' . a:5 . ' %*'
  let dir = ' %=%<%#LineNr# ' . getcwd() . ' %*'
  retu regex.item.dir
endf

:command CtrlPRefresh CtrlPClearCache

nnoremap <leader>q :CtrlPRefresh<CR>
