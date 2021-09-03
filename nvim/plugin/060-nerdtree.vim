" Check if NERDTree is open or active
fun! s:isNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endf

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | bwipeout! | q | endif

fun! NERDTree__enterAndExitTree()
  if <SID>isNERDTreeOpen()
    exe "keepalt keepjumps normal \<c-w>l"
  else
    NERDTreeToggle
    keepalt keepjumps wincmd p
  endif
endf

fun! NERDTree__toggleTree()
  if <SID>isNERDTreeOpen()
    NERDTreeToggle
  endif
endf

fun! NERDTree__syncTree()
  let l:startedOutsideTree = &filetype !=# 'nerdtree'
  NERDTreeFind
  let l:isNowInsideTree = &filetype ==# 'nerdtree'
  if l:startedOutsideTree && l:isNowInsideTree
    keepalt keepjumps wincmd p
  endif
endf

" If set to 1 then a double click on a node is required to open it.
" If set to 2 then a single click will open directory nodes, while a double
" click will still be required for file nodes.
" If set to 3 then a single click will open any node.
let NERDTreeMouseMode = 2

let NERDTreeWinPos = 'right'
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeWinSize=64
let NERDTreeDirArrowExpandable="▸"
let NERDTreeDirArrowCollapsible="▾"
let NERDTreeNodeDelimiter="\u00a0"
let NERDTreeCreatePrefix='keepalt keepjumps'

let NERDTreeIgnore = [
      \ '\.pyc$',
      \ '\.pyo$',
      \ '^CMakeFiles$',
      \ '^\.DS_Store$',
      \ '^\.cabal-sandbox',
      \ '^\.classpath$',
      \ '^\.git$',
      \ '^\.gradle$',
      \ '^\.idea$',
      \ '^\.mvn$',
      \ '^\.project$',
      \ '^\.sass-cache$',
      \ '^\.settings$',
      \ '^\.stack-work',
      \ '^\.tmp$',
      \ '^__pycache__$',
      \ '^allure-results$',
      \ '^bin$',
      \ '^bower_components$',
      \ '^build$',
      \ '^coverage$',
      \ '^dist$',
      \ '^gradle$',
      \ '^node_modules$',
      \ '^obj$',
      \ '^tags$',
      \ '^venv$',
      \ '^workbench\.xmi$',
      \ '^yesod-devel',
      \ ]

augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3
        \ | syntax match NERDTreeHideCWD #^[</].*$# conceal
        \ | setlocal concealcursor=n
augroup end

hi NERDTreeDir ctermfg=34
hi NERDTreeFile ctermfg=28
hi NERDTreeExecFile ctermfg=29
hi NERDTreeOpenable ctermfg=237
hi NERDTreeClosable ctermfg=237

hi CursorLine ctermfg=0 ctermbg=65

hi! link NERDTreeDirSlash NERDTreeDir
hi! link NERDTreeFlags NERDTreeDir

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let s:my_colour = '008787'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:my_colour
let g:NERDTreeExtensionHighlightColor['ini'] = s:my_colour
let g:NERDTreeExtensionHighlightColor['yaml'] = s:my_colour
let g:NERDTreeExtensionHighlightColor['yml'] = s:my_colour

let g:NERDTreeExactMatchHighlightColor = {}
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:my_colour
let g:NERDTreeExactMatchHighlightColor['LICENSE'] = s:my_colour

" let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
"
" let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
" let g:WebDevIconsDefaultFileSymbolColor = s:blue
