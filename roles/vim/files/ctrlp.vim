if exists("g:ctrl_user_command")
    unlet g:ctrlp_user_command
endif

set wildignore+=
      \*/tmp/*
      \*/CMakeFiles/*,
      \*/dist/*,
      \*/bin/*,
      \*/build/*,
      \*/target/*,
      \*.so,
      \*.swp,
      \*.zip,
      \*.exe,
      \*/.tmp/*,
      \*/.sass-cache/*,
      \*/node_modules/*,
      \*/jspm_packages/*,
      \*.keep,
      \*.DS_Store,
      \*/.git/*,
      \*/.svn/*,
      \*/bower_components/*,
      \*/*.xcodeproj/*,
      \*/*.app/*,
      \*.plist,
      \*.xcconfig,
      \*/.idea/*,
      \*.o,
      \*.d,
      \*.out,
      \*/bin/*,
      \*/obj/*,
      \*/coverage/*,
      \*/.gradle/*,
      \*/.settings/*,
      \*/.project,
      \*/.classpath,
      \*/workbench.xmi,
      \*/.mvn/*,
      \*/gradle/*,
      \*/.cabal-sandbox/*,
      \*/.stack-work/*,
      \*/yesod-devel/*,
      \*/*.pyc,
      \*/.tmp/*,
      \*/tags,
      \*/tags.lock,
      \*/tags.temp,
      \*/venv/*,
      \*/android/*,
      \*/ios/*,

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
function! CtrlPStatusLine(...)
  let regex = a:3 ? '%#LineNr# regex %*' : ''
  let item = ' %#Character# '.a:5.' %*'
  let dir = ' %=%<%#LineNr# '.getcwd().' %*'
  retu regex.item.dir
endfunction

:command CtrlPRefresh CtrlPClearCache

nnoremap <leader>p :CtrlPRefresh<CR>

