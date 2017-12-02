let g:vimfiler_as_default_explorer = 0
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = "▾"
let g:vimfiler_tree_closed_icon = "▸"
let g:vimfiler_readonly_file_icon = "×"
let g:vimfiler_file_icon = " "
let g:vimfiler_marked_file_icon = "░"

let g:vimfiler_ignore_filters = ['matcher_ignore_pattern']

let g:vimfiler_ignore_pattern = [
      \ '^\.git$',
      \ '^node_modules$',
      \ '^tags$',
      \ '^tags\.lock$',
      \ '^tags\.temp$',
      \ '^\.DS_Store$',
      \ ]

let s:colors = [
      \ [["ac", "am"], "249", "none"],
      \ [["c", "cc", "cpp"], "34", "none"],
      \ [["css"], "115", "none"],
      \ [["go"], "130", "none"],
      \ [["h", "hpp"], "28", "none"],
      \ [["html"], "110", "none"],
      \ [["js"], "223", "none"],
      \ [["json"], "136", "none"],
      \ [["jsx"], "221", "none"],
      \ [["log", "md"], "242", "none"],
      \ [["py"], "214", "none"],
      \ [["pyc"], "darkGrey", "none"],
      \ [["rb"], "89", "none"],
      \ [["scm"], "209", "none"],
      \ [["scss", "sass", "less"], "115", "none"],
      \ [["tpl", "jade"], "40", "none"],
      \ [["ts", "tsx"], "33", "none"],
      \ [["yaml", "yml"], "136", "none"],
      \ ]

fun! ConfigureVimfilerColors(colors)
  for color in a:colors
    let l:groupName = "vimfiler" . toupper(color[0][0])
    let l:pattern = ".\+"
    exe "au FileType vimfiler exe 'syntax match " . l:groupName . " \" " . l:pattern . "\" "
          \ . "containedin=vimfilerNormalFile "
          \ . "contains=vimfilerColumn__Type,vimfilerColumn__Size,vimfilerColumn__Time'"
    exe "hi " . l:groupName  . " ctermfg=" . color[1] . " ctermbg=" . color[2]
  endfor
endfunction

" call ConfigureVimfilerColors(s:colors)

fun! OpenVimFiler()
  if winnr('$') == 1
    execute "VimFilerExplorer -winwidth=40"
  else
    execute "wincmd w"
  endif
endf

nnoremap <silent> <C-h> :call OpenVimFiler()<CR>
nnoremap <silent> <BS> :call OpenVimFiler()<CR>
nnoremap <silent> <leader>t :VimFilerExplorer -winwidth=40 -find<CR>
nnoremap <silent> <leader>h :VimFilerExplorer<CR>

autocmd FileType vimfiler map <silent> <buffer> <C-x> <C-w><C-c>
autocmd FileType vimfiler map <silent> <buffer> <BS> <C-w><C-w>

autocmd FileType vimfiler map <silent> <buffer> <Space> <Space>
autocmd FileType vimfiler map <silent> <buffer> <CR> o

autocmd FileType vimfiler map <silent> <buffer> \ <Nop>
autocmd FileType vimfiler map <silent> <buffer> ~ <Nop>
autocmd FileType vimfiler map <silent> <buffer> a <Nop>
autocmd FileType vimfiler map <silent> <buffer> e <Nop>
autocmd FileType vimfiler map <silent> <buffer> f <Plug>(vimfiler_make_directory)
autocmd FileType vimfiler map <silent> <buffer> gc <Nop>
autocmd FileType vimfiler map <silent> <buffer> gf <Nop>
autocmd FileType vimfiler map <silent> <buffer> gr <Nop>
autocmd FileType vimfiler map <silent> <buffer> gs <Nop>
autocmd FileType vimfiler map <silent> <buffer> gS <Nop>
autocmd FileType vimfiler map <silent> <buffer> g<C-g> <Nop>
autocmd FileType vimfiler map <silent> <buffer> n <Plug>(vimfiler_new_file)
autocmd FileType vimfiler map <silent> <buffer> s <Plug>(vimfiler_toggle_mark_current_line)
autocmd FileType vimfiler vmap <silent> <buffer> s <Plug>(vimfiler_toggle_mark_selected_lines)
autocmd FileType vimfiler map <silent> <buffer> u <Plug>(vimfiler_clear_mark_all_lines)
autocmd FileType vimfiler map <silent> <buffer> v <Nop>
autocmd FileType vimfiler map <silent> <buffer> y <Plug>(vimfiler_yank_full_path)
autocmd FileType vimfiler map <silent> <buffer> x <Nop>

autocmd FileType vimfiler map <silent> <buffer> A <Plug>(vimfiler_toggle_maximize_window)
autocmd FileType vimfiler map <silent> <buffer> E <Nop>
autocmd FileType vimfiler map <silent> <buffer> H H
autocmd FileType vimfiler map <silent> <buffer> K <Nop>
autocmd FileType vimfiler map <silent> <buffer> L L
autocmd FileType vimfiler map <silent> <buffer> M M
autocmd FileType vimfiler map <silent> <buffer> N <Nop>
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

autocmd FileType vimfiler map <silent> <buffer> <2-LeftMouse> <LeftMouse>o
autocmd FileType vimfiler map <silent> <buffer> <RightMouse> <Nop>
