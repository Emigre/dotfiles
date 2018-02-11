let g:vimfiler_as_default_explorer = 0
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_readonly_file_icon = '×'
let g:vimfiler_file_icon = ' '
let g:vimfiler_marked_file_icon = '░'
let g:vimfiler_expand_jump_to_first_child = 0

if system('scutil --get ComputerName') ==# "Gaspar’s MacBook Pro\n"
  let g:vimfiler_window_width = 30
else
  let g:vimfiler_window_width = 40
endif

let g:vimfiler_ignore_filters = ['matcher_ignore_pattern']

let g:vimfiler_ignore_pattern = [
      \ '^\.deps$',
      \ '^\.git$',
      \ '^\.mvn$',
      \ '^tags\.lock$',
      \ '^tags\.temp$',
      \ '^\.DS_Store$',
      \ '^autom4te\.cache$',
      \ ]

fun! s:defineColor(id, ctermfg)
  exe 'hi def vimfilerColumn__' . a:id . 'File ctermfg=' . a:ctermfg
endf

fun! s:defineSyntaxFromRegex(id, regex)
  retu 'syntax match vimfilerColumn__' . a:id . 'File ' .
       \ '''\v' . a:regex . ''' contained containedin=vimfilerNormalFile'
endf

fun! s:defineSyntax(id, extension)
  retu <SID>defineSyntaxFromRegex(a:id, '.+\.' . a:extension . '( |$)')
endf

au FileType vimfiler exe <SID>defineSyntax('javascript', 'js') | call <SID>defineColor('javascript', 150)
au FileType vimfiler exe <SID>defineSyntax('autotools', '(ac|am)') | call <SID>defineColor('autotools', 249)
au FileType vimfiler exe <SID>defineSyntax('c', '(c|cpp|cc|cxx)') | call <SID>defineColor('c', 34)
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
au FileType vimfiler exe <SID>defineSyntax('shell', '(sh|bash)') | call <SID>defineColor('shell', 'lightCyan')
au FileType vimfiler exe <SID>defineSyntax('stylesheet', '(css|sass|less|scss)') | call <SID>defineColor('stylesheet', 115)
au FileType vimfiler exe <SID>defineSyntax('template', '(tpl|jade)') | call <SID>defineColor('template', 40)
au FileType vimfiler exe <SID>defineSyntax('typescript', '(ts|tsx)') | call <SID>defineColor('typescript', 33)
au FileType vimfiler exe <SID>defineSyntax('xml', 'xml') | call <SID>defineColor('xml', 136)
au FileType vimfiler exe <SID>defineSyntax('yaml', '(yml|yaml)') | call <SID>defineColor('yaml', 33)
au FileType vimfiler exe <SID>defineSyntaxFromRegex('temporary',
      \ '\s+(Makefile\.in|aclocal\.m4|compile|depcomp|configure|install-sh|missing|log|.+\.log)( |$)') | call <SID>defineColor('temporary', 'darkGrey')
au FileType vimfiler exe <SID>defineSyntaxFromRegex('other',
      \ '\s+(AUTHORS|ChangeLog|COPYING|INSTALL|NEWS|README|LICENSE|OWNERS|WATCHLISTS|DEPS|LICENSE\..+|BUILD.gn|tags)( |$)') | call <SID>defineColor('other', 246)
au FileType vimfiler exe <SID>defineSyntaxFromRegex('build',
      \ '\s+(CMakeLists\.txt|Makefile\.am|Makefile|configure\.ac)( |$)') | call <SID>defineColor('build', 250)
au FileType vimfiler exe <SID>defineSyntaxFromRegex('dotfiles', '\s+\..+') | call <SID>defineColor('dotfiles', 'darkGrey')

fun! s:isVimFilerOpen()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&filetype') == 'vimfiler'
      retu i
    endif
  endfor
endf

fun! s:executeVimFiler(...)
  let options = a:0 ? ' ' . a:1 : ''
  exe 'VimFiler -explorer -winwidth=' . g:vimfiler_window_width . options
endf

fun! s:enterAndExitVimFiler()
  if &filetype ==# 'vimfiler'
    exe 'wincmd w'
  else
    let vimfiler_window = <SID>isVimFilerOpen()
    if vimfiler_window
      exe vimfiler_window 'wincmd w'
    else
      call <SID>executeVimFiler()
    endif
  endif
endf

fun! s:findInVimFiler()
  if &filetype ==# 'vimfiler'
    exe 'wincmd w'
  else
    call <SID>executeVimFiler('-find')
  endif
endf

fun! s:toggleVimFiler()
  call <SID>executeVimFiler()
endf

nnoremap <silent> <C-h> :call <SID>enterAndExitVimFiler()<CR>
nnoremap <silent> <BS> :call <SID>enterAndExitVimFiler()<CR>
nnoremap <silent> <leader>t :call <SID>findInVimFiler()<CR>
nnoremap <silent> <leader>h :call <SID>toggleVimFiler()<CR>
nmap <LeftMouse> <LeftMouse><Plug>(vimfiler_smart_l)

aug MyVimfilerMaps
  au!
  au FileType vimfiler noremap <silent> <buffer> <C-x> <C-w><C-c>
  au FileType vimfiler noremap <silent> <buffer> <BS> <C-w><C-w>
  au FileType vimfiler noremap <silent> <buffer> <Space> <Space>
  au FileType vimfiler noremap <silent> <buffer> \ <Nop>
  au FileType vimfiler noremap <silent> <buffer> ~ <Nop>
  au FileType vimfiler noremap <silent> <buffer> a <Nop>
  au FileType vimfiler noremap <silent> <buffer> e <Nop>
  au FileType vimfiler nmap <silent> <buffer> f <Plug>(vimfiler_new_file)
  au FileType vimfiler noremap <silent> <buffer> gc <Nop>
  au FileType vimfiler noremap <silent> <buffer> gf <Nop>
  au FileType vimfiler noremap <silent> <buffer> gr <Nop>
  au FileType vimfiler noremap <silent> <buffer> gs <Nop>
  au FileType vimfiler noremap <silent> <buffer> gS <Nop>
  au FileType vimfiler noremap <silent> <buffer> g<C-g> <Nop>
  au FileType vimfiler noremap <silent> <buffer> h <Nop>
  au FileType vimfiler noremap <silent> <buffer> n n
  au FileType vimfiler noremap <silent> <buffer> p <Nop>
  au FileType vimfiler nmap <silent> <buffer> s <Plug>(vimfiler_toggle_mark_current_line)
  au FileType vimfiler vmap <silent> <buffer> s <Plug>(vimfiler_toggle_mark_selected_lines)
  au FileType vimfiler nmap <silent> <buffer> u <Plug>(vimfiler_clear_mark_all_lines)
  au FileType vimfiler noremap <silent> <buffer> v <Nop>
  au FileType vimfiler nmap <silent> <buffer> y <Plug>(vimfiler_yank_full_path)
  au FileType vimfiler nmap <silent> <buffer> x <Plug>(vimfiler_expand_tree)
  au FileType vimfiler nmap <silent> <buffer> A <Plug>(vimfiler_toggle_maximize_window)
  au FileType vimfiler noremap <silent> <buffer> E <Nop>
  au FileType vimfiler nmap <silent> <buffer> F <Plug>(vimfiler_make_directory)
  au FileType vimfiler noremap <silent> <buffer> H H
  au FileType vimfiler noremap <silent> <buffer> K <Nop>
  au FileType vimfiler noremap <silent> <buffer> L L
  au FileType vimfiler noremap <silent> <buffer> M M
  au FileType vimfiler noremap <silent> <buffer> N N
  au FileType vimfiler nmap <silent> <buffer> O <Plug>(vimfiler_expand_tree_recursive)
  au FileType vimfiler noremap <silent> <buffer> P <Nop>
  au FileType vimfiler nmap <silent> <buffer> R <Plug>(vimfiler_redraw_screen)
  au FileType vimfiler noremap <silent> <buffer> S <Nop>
  au FileType vimfiler noremap <silent> <buffer> T <Nop>
  au FileType vimfiler noremap <silent> <buffer> U <Nop>
  au FileType vimfiler noremap <silent> <buffer> Y <Nop>
  au FileType vimfiler noremap <silent> <buffer> <C-i> <Nop>
  au FileType vimfiler noremap <silent> <buffer> <C-j> <Nop>
  au FileType vimfiler noremap <silent> <buffer> <C-k> <Nop>
  au FileType vimfiler noremap <silent> <buffer> <C-l> <Nop>
  au FileType vimfiler noremap <silent> <buffer> <C-o> <Nop>
  au FileType vimfiler noremap <silent> <buffer> <C-v> <C-v>
  au FileType vimfiler noremap <buffer> <2-LeftMouse> <Nop>
  au FileType vimfiler noremap <silent> <buffer> <RightMouse> <Nop>

  au FileType unite_exrename noremap <silent> <buffer> <BS> <BS>
aug END
