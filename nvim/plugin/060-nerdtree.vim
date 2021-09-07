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
let NERDTreeMouseMode = 3

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

hi NERDTreeDir guifg=#00af00
hi NERDTreeFile guifg=#009900
hi NERDTreeExecFile guifg=#00285f
hi NERDTreeOpenable guifg=#3a3a3a
hi NERDTreeClosable guifg=#3a3a3a

hi CursorLine guifg=#000000 guibg=#5f875f

hi! link NERDTreeDirSlash NERDTreeDir
hi! link NERDTreeFlags NERDTreeDir

" let g:NERDTreeDisableFileExtensionHighlight = 1
let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['conf'] = '26a077'
let g:NERDTreeExtensionHighlightColor['css'] = '26a077'
let g:NERDTreeExtensionHighlightColor['ini'] = '26a077'
let g:NERDTreeExtensionHighlightColor['lua'] = '268ca0'
let g:NERDTreeExtensionHighlightColor['yaml'] = '26a077'
let g:NERDTreeExtensionHighlightColor['yml'] = '26a077'

let g:NERDTreeExactMatchHighlightColor = {}
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = '26a077'
let g:NERDTreeExactMatchHighlightColor['LICENSE'] = '26a077'
