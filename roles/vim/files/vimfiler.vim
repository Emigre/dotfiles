let g:vimfiler_as_default_explorer = 0
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = "▾"
let g:vimfiler_tree_closed_icon = "▸"
let g:vimfiler_readonly_file_icon = "×"
let g:vimfiler_file_icon = " "
let g:vimfiler_marked_file_icon = "░"
let g:vimfiler_expand_jump_to_first_child = 0

if system('scutil --get ComputerName') ==# "Gaspar’s MacBook Pro\n"
  let g:vimfiler_window_width = 40
else
  let g:vimfiler_window_width = 40
endif

let g:vimfiler_ignore_filters = ['matcher_ignore_pattern']

let g:vimfiler_ignore_pattern = [
      \ '^\.git$',
      \ '^\.mvn$',
      \ '^node_modules$',
      \ '^tags$',
      \ '^tags\.lock$',
      \ '^tags\.temp$',
      \ '^\.DS_Store$',
      \ '^\.idea$',
      \ '.xcworkspace$',
      \ ]

fun! s:defineColor(id, ctermfg)
  exe 'hi def vimfilerColumn__' . a:id . 'File ctermfg=' . a:ctermfg
endf

fun! s:defineSyntaxFromRegex(id, regex)
  return 'syntax match vimfilerColumn__' . a:id . 'File ' .
       \ '''\v' . a:regex . ''' contained containedin=vimfilerNormalFile'
endf

fun! s:defineSyntax(id, extension)
  return <SID>defineSyntaxFromRegex(a:id, '.+\.' . a:extension . '[ $]')
endf

au FileType vimfiler exe <SID>defineSyntax('javascript', 'js') | call <SID>defineColor('javascript', 150)
au FileType vimfiler exe <SID>defineSyntax('autotools', '(ac|am)') | call <SID>defineColor('autotools', 249)
au FileType vimfiler exe <SID>defineSyntax('c', '(c|cpp|cc)') | call <SID>defineColor('c', 34)
au FileType vimfiler exe <SID>defineSyntax('compiled', '(o|pyc)') | call <SID>defineColor('compiled', 'darkGrey')
au FileType vimfiler exe <SID>defineSyntax('go', 'go') | call <SID>defineColor('go', 130)
au FileType vimfiler exe <SID>defineSyntax('header', '(h|hpp)') | call <SID>defineColor('header', 28)
au FileType vimfiler exe <SID>defineSyntax('html', '(htm|html)') | call <SID>defineColor('html', 130)
au FileType vimfiler exe <SID>defineSyntax('java', 'java') | call <SID>defineColor('java', 146)
au FileType vimfiler exe <SID>defineSyntax('json', 'json') | call <SID>defineColor('json', 71)
au FileType vimfiler exe <SID>defineSyntax('jsx', 'jsx') | call <SID>defineColor('jsx', 150)
au FileType vimfiler exe <SID>defineSyntax('lua', 'lua') | call <SID>defineColor('lua', 214)
au FileType vimfiler exe <SID>defineSyntax('markdown', 'md') | call <SID>defineColor('markdown', 249)
au FileType vimfiler exe <SID>defineSyntax('python', 'py') | call <SID>defineColor('python', 214)
au FileType vimfiler exe <SID>defineSyntax('ruby', 'rb') | call <SID>defineColor('ruby', 89)
au FileType vimfiler exe <SID>defineSyntax('shell', 'sh') | call <SID>defineColor('shell', 'lightCyan')
au FileType vimfiler exe <SID>defineSyntax('stylesheet', '(css|sass|less|scss)') | call <SID>defineColor('stylesheet', 115)
au FileType vimfiler exe <SID>defineSyntax('template', '(tpl|jade)') | call <SID>defineColor('template', 40)
au FileType vimfiler exe <SID>defineSyntax('typescript', '(ts|tsx)') | call <SID>defineColor('typescript', 33)
au FileType vimfiler exe <SID>defineSyntax('xml', 'xml') | call <SID>defineColor('xml', 136)
au FileType vimfiler exe <SID>defineSyntax('yaml', '(yml|yaml)') | call <SID>defineColor('yaml', 33)
au FileType vimfiler exe <SID>defineSyntaxFromRegex('make', '\s+(CMakeLists\.txt|Makefile|.+\.cmake)[ $]') | call <SID>defineColor('make', 249)
au FileType vimfiler exe <SID>defineSyntaxFromRegex('dotfiles', '\s+\..+') | call <SID>defineColor('dotfiles', 'darkGrey')

fun! s:isVimFilerOpen()
  for i in range(1, winnr('$'))
      let bnum = winbufnr(i)
      if getbufvar(bnum, '&filetype') == 'vimfiler'
          return i
      endif
  endfor
endf

fun! s:executeVimFiler(...)
  let options = a:0 ? ' ' . a:1 : ''
  execute 'VimFiler -explorer -winwidth=' . g:vimfiler_window_width . options
endf

fun! s:enterAndExitVimFiler()
  if &filetype ==? 'vimfiler'
    execute "wincmd w"
  else
    let vimfiler_window = <SID>isVimFilerOpen()
    if vimfiler_window
      execute vimfiler_window 'wincmd w'
    else
      call <SID>executeVimFiler()
    endif
  endif
endf

fun! s:findInVimFiler()
  if &filetype == 'vimfiler'
    execute 'wincmd w'
  else
    call <SID>executeVimFiler('-find')
  endif
endf

fun! s:toggleVimFiler()
  call <SID>executeVimFiler()
endf

nnoremap <silent> <C-h> :call <SID>enterAndExitVimFiler()<CR>
nnoremap <silent> <BS> :call <SID>enterAndExitVimFiler()<CR>
nnoremap <silent> <leader>h :call <SID>findInVimFiler()<CR>
nnoremap <silent> <leader>t :call <SID>toggleVimFiler()<CR>
nnoremap <LeftMouse> <LeftMouse><Plug>(vimfiler_smart_l)

aug myVimfilerMaps
  au!
  au FileType vimfiler map <silent> <buffer> <C-x> <C-w><C-c>
  au FileType vimfiler map <silent> <buffer> <BS> <C-w><C-w>
  au FileType vimfiler map <silent> <buffer> <Space> <Space>
  au FileType vimfiler map <silent> <buffer> <CR> o
  au FileType vimfiler map <silent> <buffer> \ <Nop>
  au FileType vimfiler map <silent> <buffer> ~ <Nop>
  au FileType vimfiler map <silent> <buffer> a <Nop>
  au FileType vimfiler map <silent> <buffer> e <Nop>
  au FileType vimfiler map <silent> <buffer> f <Plug>(vimfiler_new_file)
  au FileType vimfiler map <silent> <buffer> gc <Nop>
  au FileType vimfiler map <silent> <buffer> gf <Nop>
  au FileType vimfiler map <silent> <buffer> gr <Nop>
  au FileType vimfiler map <silent> <buffer> gs <Nop>
  au FileType vimfiler map <silent> <buffer> gS <Nop>
  au FileType vimfiler map <silent> <buffer> g<C-g> <Nop>
  au FileType vimfiler map <silent> <buffer> n n
  au FileType vimfiler map <silent> <buffer> s <Plug>(vimfiler_toggle_mark_current_line)
  au FileType vimfiler vmap <silent> <buffer> s <Plug>(vimfiler_toggle_mark_selected_lines)
  au FileType vimfiler map <silent> <buffer> u <Plug>(vimfiler_clear_mark_all_lines)
  au FileType vimfiler map <silent> <buffer> v <Nop>
  au FileType vimfiler map <silent> <buffer> y <Plug>(vimfiler_yank_full_path)
  au FileType vimfiler map <silent> <buffer> x <Nop>
  au FileType vimfiler map <silent> <buffer> A <Plug>(vimfiler_toggle_maximize_window)
  au FileType vimfiler map <silent> <buffer> E <Nop>
  au FileType vimfiler map <silent> <buffer> F <Plug>(vimfiler_make_directory)
  au FileType vimfiler map <silent> <buffer> H H
  au FileType vimfiler map <silent> <buffer> K <Nop>
  au FileType vimfiler map <silent> <buffer> L L
  au FileType vimfiler map <silent> <buffer> M M
  au FileType vimfiler map <silent> <buffer> N N
  au FileType vimfiler map <silent> <buffer> O <Plug>(vimfiler_expand_tree_recursive)
  au FileType vimfiler map <silent> <buffer> P <Nop>
  au FileType vimfiler map <silent> <buffer> R <Plug>(vimfiler_redraw_screen)
  au FileType vimfiler map <silent> <buffer> S <Nop>
  au FileType vimfiler map <silent> <buffer> T <Nop>
  au FileType vimfiler map <silent> <buffer> U <Nop>
  au FileType vimfiler map <silent> <buffer> Y <Nop>
  au FileType vimfiler map <silent> <buffer> <C-g> :call EnterAndExitQuickFix()<CR>
  au FileType vimfiler map <silent> <buffer> <C-i> <Nop>
  au FileType vimfiler map <silent> <buffer> <C-j> <Nop>
  au FileType vimfiler map <silent> <buffer> <C-k> <Nop>
  au FileType vimfiler map <silent> <buffer> <C-l> <Nop>
  au FileType vimfiler map <silent> <buffer> <C-o> <Nop>
  au FileType vimfiler map <silent> <buffer> <C-v> <C-v>
  au FileType vimfiler map <buffer> <2-LeftMouse> <Nop>
  au FileType vimfiler map <silent> <buffer> <RightMouse> <Nop>
aug end
