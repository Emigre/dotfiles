let g:vimfiler_as_default_explorer = 0
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = "▾"
let g:vimfiler_tree_closed_icon = "▸"
let g:vimfiler_readonly_file_icon = "×"
let g:vimfiler_file_icon = " "
let g:vimfiler_marked_file_icon = "░"
let g:vimfiler_expand_jump_to_first_child = 0

if system('scutil --get ComputerName') == "Gaspar’s MacBook Pro\n"
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

au FileType vimfiler exe "syntax match vimfilerColumn__AMFile '.\\+\\.\\%(ac\\|am\\)[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__AMFile ctermfg=249

au FileType vimfiler exe "syntax match vimfilerColumn__CFile '.\\+\\.\\%(c\\|cpp\\|cc\\)[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__CFile ctermfg=34

au FileType vimfiler exe "syntax match vimfilerColumn__DotFile '\\%(.vimrc\\|.gitignore\\|.gitattributes\\|.editorconfig\\|.clang-format\\|.gdb_history\\)'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__DotFile ctermfg=darkGrey

au FileType vimfiler exe "syntax match vimfilerColumn__CompiledFile '.\\+\\.\\%(o\\|pyc\\)[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__CompiledFile ctermfg=darkGrey

au FileType vimfiler exe "syntax match vimfilerColumn__GOFile '.\\+\\.go[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__GOFile ctermfg=130

au FileType vimfiler exe "syntax match vimfilerColumn__HeaderFile '.\\+\\.\\%(h\\|hpp\\)[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__HeaderFile ctermfg=28

au FileType vimfiler exe "syntax match vimfilerColumn__HTMLFile '.\\+\\.\\%(html\\|htm\\)[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__HTMLFile ctermfg=130

au FileType vimfiler exe "syntax match vimfilerColumn__JAVAFile '.\\+\\.java[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__JAVAFile ctermfg=146

au FileType vimfiler exe "syntax match vimfilerColumn__JSFile '.\\+\\.js\\>'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__JSFile ctermfg=150

au FileType vimfiler exe "syntax match vimfilerColumn__JSONFile '.\\+\\.json[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__JSONFile ctermfg=71

au FileType vimfiler exe "syntax match vimfilerColumn__JSXFile '.\\+\\.jsx[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__JSXFile ctermfg=150

au FileType vimfiler exe "syntax match vimfilerColumn__LUAFile '.\\+\\.lua[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__LUAFile ctermfg=214

au FileType vimfiler exe "syntax match vimfilerColumn__MDFile '.\\+\\.\\%(md\\|log\\)[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__MDFile ctermfg=249

au FileType vimfiler exe "syntax match vimfilerColumn__MakefileFile '.\\+\\.cmake[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
au FileType vimfiler exe "syntax match vimfilerColumn__MakefileFile '\\%(CMakeLists.txt\\|Makefile\\)[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__MakefileFile ctermfg=249

au FileType vimfiler exe "syntax match vimfilerColumn__PYFile '.\\+\\.py[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__PYFile ctermfg=214

au FileType vimfiler exe "syntax match vimfilerColumn__RBFile '.\\+\\.rb[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__RBFile ctermfg=89

au FileType vimfiler exe "syntax match vimfilerColumn__SHFile '.\\+\\.sh[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__SHFile ctermfg=lightcyan

au FileType vimfiler exe "syntax match vimfilerColumn__StyleFile '.\\+\\.\\%(css\\|sass\\|less\\|scss\\)[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__StyleFile ctermfg=115

au FileType vimfiler exe "syntax match vimfilerColumn__TemplateFile '.\\+\\.\\%(tpl\\|jade\\)[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__TemplateFile ctermfg=40

au FileType vimfiler exe "syntax match vimfilerColumn__TSFile '.\\+\\.\\%(ts\\|tsx\\)[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__TSFile ctermfg=33

au FileType vimfiler exe "syntax match vimfilerColumn__XMLFile '.\\+\\.xml[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__XMLFile ctermfg=136

au FileType vimfiler exe "syntax match vimfilerColumn__YAMLFile '.\\+\\.\\%(yaml\\|yml\\)[^a-zA-Z\\s.\\-]'" .
      \ " contained containedin=vimfilerNormalFile"
highlight def vimfilerColumn__YAMLFile ctermfg=33

fun! IsVimFilerOpen()
  for i in range(1, winnr('$'))
      let bnum = winbufnr(i)
      if getbufvar(bnum, '&filetype') == 'vimfiler'
          return i
      endif
  endfor
  return 0
endf

fun! ExecuteVimFiler(...)
  let options = a:0 ? (' ' . a:1) : ''
  execute 'VimFiler -explorer -winwidth=' . g:vimfiler_window_width . options
endf

fun! EnterAndExitVimFiler()
  if &filetype == 'vimfiler'
    execute "wincmd w"
  else
    let vimfilerwindow = IsVimFilerOpen()
    if vimfilerwindow
      execute vimfilerwindow 'wincmd w'
    else
      call ExecuteVimFiler()
    endif
  endif
endf

fun! FindInVimFiler()
  if &filetype == 'vimfiler'
    execute 'wincmd w'
  else
    call ExecuteVimFiler('-find')
  endif
endf

fun! ToggleVimFiler()
  call ExecuteVimFiler()
endf

nnoremap <silent> <C-h> :call EnterAndExitVimFiler()<CR>
nnoremap <silent> <BS> :call EnterAndExitVimFiler()<CR>
nnoremap <silent> <leader>h :call FindInVimFiler()<CR>
nnoremap <silent> <leader>t :call ToggleVimFiler()<CR>

autocmd FileType vimfiler map <silent> <buffer> <C-x> <C-w><C-c>
autocmd FileType vimfiler map <silent> <buffer> <BS> <C-w><C-w>

autocmd FileType vimfiler map <silent> <buffer> <Space> <Space>
autocmd FileType vimfiler map <silent> <buffer> <CR> o

autocmd FileType vimfiler map <silent> <buffer> \ <Nop>
autocmd FileType vimfiler map <silent> <buffer> ~ <Nop>
autocmd FileType vimfiler map <silent> <buffer> a <Nop>
autocmd FileType vimfiler map <silent> <buffer> e <Nop>
autocmd FileType vimfiler map <silent> <buffer> f <Plug>(vimfiler_new_file)
autocmd FileType vimfiler map <silent> <buffer> gc <Nop>
autocmd FileType vimfiler map <silent> <buffer> gf <Nop>
autocmd FileType vimfiler map <silent> <buffer> gr <Nop>
autocmd FileType vimfiler map <silent> <buffer> gs <Nop>
autocmd FileType vimfiler map <silent> <buffer> gS <Nop>
autocmd FileType vimfiler map <silent> <buffer> g<C-g> <Nop>
autocmd FileType vimfiler map <silent> <buffer> n n
autocmd FileType vimfiler map <silent> <buffer> s <Plug>(vimfiler_toggle_mark_current_line)
autocmd FileType vimfiler vmap <silent> <buffer> s <Plug>(vimfiler_toggle_mark_selected_lines)
autocmd FileType vimfiler map <silent> <buffer> u <Plug>(vimfiler_clear_mark_all_lines)
autocmd FileType vimfiler map <silent> <buffer> v <Nop>
autocmd FileType vimfiler map <silent> <buffer> y <Plug>(vimfiler_yank_full_path)
autocmd FileType vimfiler map <silent> <buffer> x <Nop>

autocmd FileType vimfiler map <silent> <buffer> A <Plug>(vimfiler_toggle_maximize_window)
autocmd FileType vimfiler map <silent> <buffer> E <Nop>
autocmd FileType vimfiler map <silent> <buffer> F <Plug>(vimfiler_make_directory)
autocmd FileType vimfiler map <silent> <buffer> H H
autocmd FileType vimfiler map <silent> <buffer> K <Nop>
autocmd FileType vimfiler map <silent> <buffer> L L
autocmd FileType vimfiler map <silent> <buffer> M M
autocmd FileType vimfiler map <silent> <buffer> N N
autocmd FileType vimfiler map <silent> <buffer> O <Plug>(vimfiler_expand_tree_recursive)
autocmd FileType vimfiler map <silent> <buffer> P <Nop>
autocmd FileType vimfiler map <silent> <buffer> R <Plug>(vimfiler_redraw_screen)
autocmd FileType vimfiler map <silent> <buffer> S <Nop>
autocmd FileType vimfiler map <silent> <buffer> T <Nop>
autocmd FileType vimfiler map <silent> <buffer> U <Nop>
autocmd FileType vimfiler map <silent> <buffer> Y <Nop>

autocmd FileType vimfiler map <silent> <buffer> <C-g> <Nop>
autocmd FileType vimfiler map <silent> <buffer> <C-i> <Nop>
autocmd FileType vimfiler map <silent> <buffer> <C-j> <Nop>
autocmd FileType vimfiler map <silent> <buffer> <C-k> <Nop>
autocmd FileType vimfiler map <silent> <buffer> <C-l> <Nop>
autocmd FileType vimfiler map <silent> <buffer> <C-o> <Nop>
autocmd FileType vimfiler map <silent> <buffer> <C-v> <C-v>

nmap <LeftMouse> <LeftMouse><Plug>(vimfiler_smart_l)
autocmd FileType vimfiler nmap <buffer> <2-LeftMouse> <Nop>
autocmd FileType vimfiler map <silent> <buffer> <RightMouse> <Nop>
