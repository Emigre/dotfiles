let g:netrw_special_syntax = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_preview = 1
let g:netrw_rm_cmd = "rm"

autocmd FileType netrw setl bufhidden=wipe


" Ignore patterns
"""""""""""""""""

let g:netrw_list_hide = "
      \^.DS_Store$,
      \^node_modules/$,
      \^tags$,
      \^tags\.lock$,
      \^tags\.temp$,
      \^\.git/$,
      \^\.tmp/$,
      \"


" Sorting options
"""""""""""""""""

let g:netrw_sort_by = "name"
let g:netrw_sort_options="i"
let g:netrw_sort_sequence = '[\/]$'


" Disabled key bindings in netrw
""""""""""""""""""""""""""""""""

" dsiable toggle display mode
autocmd FileType netrw map <buffer> a a
" disable make browsing directory the current directory
autocmd FileType netrw map <buffer> c c
" disable setting the editing window
autocmd FileType netrw map <buffer> C C
" o redefined later as open
autocmd FileType netrw map <buffer> o o
" TODO - O redefined later as open children
autocmd FileType netrw map <buffer> O O
" disable browse in the previously used window
autocmd FileType netrw map <buffer> P P
" TODO - disable r for reverse sorting order and define later for rename instead of R
autocmd FileType netrw map <buffer> r r
" TODO - disable R for rename and define later for refresh instead of <C-l>
autocmd FileType netrw map <buffer> R R
autocmd FileType netrw map <buffer> <C-l> <C-l>
" disable select sorting style
autocmd FileType netrw map <buffer> s s
" disable specify suffix priority for name-sorting
autocmd FileType netrw map <buffer> S S
" disable enter the file/directory under the cursor in a new tab
autocmd FileType netrw map <buffer> t t
" disable enter the file/directory under the cursor in a new window
autocmd FileType netrw map <buffer> v v
" x redefined later as close folder
autocmd FileType netrw map <buffer> x x
" TODO - x redefined later as close children
autocmd FileType netrw map <buffer> X X


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

fun! NrwIsInTreeListing()
  return strgetchar(getline(3), 0) == 124
endf

fun! NrwGoToFileInTree(fileName, route)
  for i in a:route
    try
      silent execute ":Explore " . i
    catch
    endtry
  endfor
  try
    let l:dest = "| "
    silent execute "\/^|\\ [^|].\\+[^/]$"
    for i in a:route
      if i == '.'
      else
        silent execute "\/" . i . "\/"
        let l:dest = l:dest . "| "
      endif
    endfor
    let l:dest = l:dest . a:fileName
    silent execute "\/^" . l:dest . "$"
  catch
  endtry
endf

fun! NrwExplore(...)
  let l:path = substitute(expand('%:p'), '^' . getcwd(), '', '')
  let l:fileName = expand('%:t')
  let l:route = split(l:path, '/')
  if a:0 > 0
    execute ":Explore " . a:1
  elseif empty(l:path)
    execute ":Explore ."
  else
    execute ":Explore ."
    if NrwIsInTreeListing()
      call NrwGoToFileInTree(l:fileName, l:route)
      normal zz
    endif
  endif
endf

fun! NrwCycleOrExplore()
  if winnr('$') == 1
    call NrwExplore()
  else
    execute "wincmd w"
  endif
endf

nnoremap <silent> <space>h  :call NrwExplore('.')<CR>

nnoremap <silent> <C-h> :call NrwCycleOrExplore()<CR>
nnoremap <silent> <BS> :call NrwCycleOrExplore()<CR>

autocmd FileType netrw map <silent> <buffer> <C-h> <C-j>
autocmd FileType netrw map <silent> <buffer> <C-x> <C-j>
autocmd FileType netrw map <silent> <buffer> <BS> <C-j>
autocmd FileType netrw map <silent> <buffer> <Space>h <C-j>


" Modified key bindings
"""""""""""""""""""""""

" Open file with o as with <CR>
autocmd FileType netrw map <buffer> o <CR>
" Also for the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> o <CR>
" Refresh the screen
autocmd FileType netrw map <silent> <buffer> <c-r> <Plug>NetrwRefresh


" Improved navigation
"""""""""""""""""""""

fun! NrwFindParentFolder(folderLevel)
  silent exe "?^\\%(|\\ \\)\\{" . (a:folderLevel - 1) . "}[^|]\\+\/$"
endf

fun! NrwGetFolderLevel()
  let l:line = getline('.')
  let l:pipes = matchend(l:line, '^\%(|\ \)\+')
  let l:level = l:pipes == -1 ? -1 : l:pipes / 2
  return l:level
endf

fun! NrwCloseBranch()
  if NrwIsInTreeListing()
    let l:folderLevel = NrwGetFolderLevel()
    if l:folderLevel > 1
      try
        call NrwFindParentFolder(l:folderLevel)
        normal o
      catch
      endtry
    endif
  endif
endf

autocmd FileType netrw map <silent> <buffer> x :call NrwCloseBranch()<CR>

" TODO ...

" fun! NrwIsFolder()
"   let l:line = getline('.')
"   let l:isFolder = l:line[len(l:line) - 1] == '/'
"   return l:isFolder
" endf
"
" fun! NrwOpenChildren()
"   if NrwIsInTreeListing()
"     let l:folderLevel = NrwGetFolderLevel()
"     if l:folderLevel > 1
"       let l:maximumDepth = l:folderLevel + 1
"       let l:startingLevel = l:folderLevel
"       let l:startingLine = line('.')
"       let l:lastLine = line("w$")
"       let l:currentLine = l:startingLine
"       while l:currentLine <= l:lastLine
"         norm j
"         let l:isFolder = NrwIsFolder()
"         let l:level = NrwGetFolderLevel()
"         if l:level < l:startingLevel
"           break
"         elseif l:isFolder && l:level < l:maximumDepth
"           norm o
"         endif
"       endwhile
"       exe "norm " . l:startingLine . "gg"
"     endif
"   endif
" endf

" autocmd FileType netrw map <silent> <buffer> O :call NrwOpenChildren()<CR>

" fun! NrwCloseChildren()
" endf

" autocmd FileType netrw map <silent> <buffer> X :call NrwCloseChildren()<CR>
