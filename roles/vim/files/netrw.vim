let g:netrw_special_syntax = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0

autocmd FileType netrw setl bufhidden=wipe


" Ignore patterns
"""""""""""""""""

let s:ignore = ['.git/']
let s:gitignore = map(split(substitute(substitute(netrw_gitignore#Hide(),
      \ '\.\*', '*', 'g'), '\\.', '.', 'g'), ','), "v:val.','.v:val.'/'")
let &wildignore = join(s:gitignore + s:ignore, ',')


" Syntax highlighting
"""""""""""""""""""""

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

fun! ConfigureNrwColors(colors)
  for color in a:colors
    let l:groupName = "netrw" . toupper(color[0][0]) . "ColorHighlight"
    let l:pattern = "\\(\\S\\+ \\)*\\S*\\.\\%(" . join(color[0], "\\|") . "\\)\\>"
    exe "hi " . l:groupName  . " ctermfg=" . color[1] . " ctermbg=" . color[2]
    exe "au FileType netrw exe 'syn match " . l:groupName . " \"" . l:pattern .
          \ "\" contains=netrwTreeBar,@NoSpell'"
  endfor
endfunction

call ConfigureNrwColors(s:colors)

" Opening and closing netrw
"""""""""""""""""""""""""""

fun! NrwExplore()
  let l:path = substitute(expand('%:p'), '^' . getcwd(), '', '')
  let l:fileName = expand('%:t')
  let l:route = split(l:path, '/')
  if empty(l:path)
    execute ":Explore ."
  else
    execute ":Explore ."
    for i in l:route
      try
        silent execute ":Explore " . i
      catch
      endtry
    endfor
    try
      let l:dest = "| "
      silent execute "\/^|\\ [^|].\\+[^/]$"
      for i in l:route
        if i == '.'
        else
          silent execute "\/" . i . "\/"
          let l:dest = l:dest . "| "
        endif
      endfor
      let l:dest = l:dest . l:fileName
      silent execute "\/^" . l:dest . "$"
    catch
    endtry
    normal zz
  endif
endf

" Open nertw
nnoremap <silent> <C-h> :call NrwExplore()<CR>
nnoremap <silent> <BS> :call NrwExplore()<CR>
nnoremap <silent> <space><space> :Explore .<CR>

" Close netrw
autocmd FileType netrw map <buffer> <C-h> <C-j>
autocmd FileType netrw map <buffer> <BS> <C-j>
autocmd FileType netrw map <buffer> <Space><Space> <C-j>


" Modified key bindings
"""""""""""""""""""""""

" Open file with o as with <CR>
autocmd FileType netrw map <buffer> o <CR>
" Also for the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> o <CR>
" Refresh the screen
autocmd FileType netrw map <buffer> <c-r> <Plug>NetrwRefresh
" nnoremap <silent> <C-h> :winc w<CR>
" nnoremap <silent> <BS> :winc w<CR>



" Disabled key bindings in netrw
""""""""""""""""""""""""""""""""

autocmd FileType netrw map <buffer> x x

" TODO ...


" Improved navigation
"""""""""""""""""""""

" TODO ...


" Filesystem operations
"""""""""""""""""""""""

" function! VexOpenFile()
"   let l:filename = input("please enter filename: ")
"   execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename
"   call VexOpen()
"   call VexClose()
"   redraw!
" endf

" autocmd FileType netrw noremap <buffer>% :call VexOpenFile()<CR>

" TODO ...
