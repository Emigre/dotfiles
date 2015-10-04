" ctrlp.vim
" ---------
if exists("g:ctrl_user_command")
    unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*/dist/*,*/build/*,*/target/*,*.so,*.swp,*.zip,*.exe,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*,*/.svn/*,*/bower_components/*,*/*.xcodeproj/*,*.plist,*.xcconfig,*/.idea/*
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'

" CtrlP root markers (_ctrlp or .ctrlp files)
" https://coderwall.com/p/5xv7sq
if has("win32") || has("win16")
  let g:ctrlp_root_markers = ['_ctrlp']
else
  let g:ctrlp_root_markers = ['.ctrlp']
endif

" Show hidden files
let g:ctrlp_show_hidden = 1

let g:ctrlp_status_func = { 'main': 'CtrlPStatusLine' }

" Main statusline
function! CtrlPStatusLine(...)
  " let focus = '%#LineNr# '.a:1.' %*'
  " let byfname = '%#Character# '.a:2.' %*'
  let regex = a:3 ? '%#LineNr# regex %*' : ''
  "let prv = ' <'.a:4.'>='
  let item = ' %#Character# '.a:5.' %*'
  " let nxt = '=<'.a:6.'>'
  " let marked =' '.a:7.' '
  let dir = ' %=%<%#LineNr# '.getcwd().' %*'
  retu regex.item.dir
endfunction

nmap <leader>= :CtrlPClearCache<CR>