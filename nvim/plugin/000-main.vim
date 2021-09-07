set termguicolors
set autoread
set ruler
set rulerformat=%l,%c%=%P
set noswapfile
set nofoldenable

" leader key
let mapleader = "\<Space>"

" colors
colorscheme Zenburn

syntax on

" indentation
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
set smartindent

" Detect file type of C++ standard headers
au BufRead * if search('\M-*- C++ -*-', 'n', 1) | setlocal ft=cpp | endif

" Other filetypes
au BufRead,BufNewFile *.tf,*.tfvars set ft=terraform

" Syntax adjustments per filetype
aug TabSettings
  au!
  au Filetype groovy setlocal ts=4 sts=4 sw=4 et
  " fixes weird underline problem in the groovy syntax
  au Filetype groovy syn clear groovyUserLabel
  au Filetype java setlocal ts=4 sw=4 et
  " also fixes weird underline problem in the java syntax
  au Filetype java syn clear javaUserLabel
  au FileType json syntax match Comment +\/\/.\+$+
  au FileType make set noexpandtab sw=4 sts=4
  au Filetype python setlocal ts=4 sts=4 sw=4 et
  au Filetype swift setlocal ts=4 sts=4 sw=4 et
  au Filetype objc setlocal ts=4 sts=4 sw=4 et
  au Filetype objcpp setlocal ts=4 sts=4 sw=4 et
  au Filetype tags setlocal ts=32
  au Filetype tags setlocal nowrap
  au Filetype xml setlocal ts=4 sts=4 sw=4 et
  " fixes weird underline problem in the yaml syntax
  au Filetype yaml syn clear yamlBlockCollectionItemStart
aug END

" The width of a TAB is set to 4
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 2
set tabstop=4

" Indents will have a width of 2
set shiftwidth=2

" Sets the number of columns for a TAB
set softtabstop=2

" Finally expand TABs to spaces
set expandtab

" Paste mode. Reflowing comment blocks with gq needs nopaste.
" http://stackoverflow.com/questions/8435808/reflowing-comment-blocks-with-vim
" http://blog.ayaz.pk/2008/06/21/paste-mode-pasting-text-and-indenting-it-in-vim/
set nopaste

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

" Set a character for the tabs
set listchars=nbsp:␣,tab:\᠁\ "
set list
hi SpecialKey guifg=#808080

" bright green background for search matches when typing the search
hi IncSearch guibg=#87af87 gui=NONE

" color for search matches across the file and selected item in the quickfix
hi Search guifg=#000000 guibg=#87af87
hi qfFileName guifg=#87afaf

" Color of matching brackets
hi MatchParen guibg=NONE guifg=#00cd00

" Color of floating window
hi NormalFloat guifg=#87af87 guibg=#000000

" Set some commands that I often write in a wrong way by mistake
command -bang Q q
command -bang Qa qa
command W w
command -bang Wq wq
command Ccl ccl

set timeout         " Do time out on mappings and others
set timeoutlen=2000 " Wait {num} ms before timing out a mapping

" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
  set ttimeoutlen=10
  aug FastEscape
    au!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  aug END
endif

fun! s:UpdateStatus()
  retu 'updated!'
endf

" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
if !has('nvim')
  set esckeys
endif
" Do not highlight searches by default
set nohlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Enable mouse in all modes
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif
" Set more characters for redraws
set ttyfast
" Disable all error bells
set noerrorbells
set noerrorbells
set novisualbell
set t_vb=
au! GUIEnter * set vb t_vb=
" Don’t show the intro message when starting Vim
set shortmess=atI

" tell vim to use an undo file
set undofile

" Centralize undo history
if exists("&undodir")
  set undodir=~/.local/share/nvim/undo
endif

" Automatic commands
if has('autocmd')
  " Enable file type detection
  filetype on
  au BufNewFile,BufRead *.json setf json syntax=javascript
  au BufNewFile,BufRead Jenkinsfile setf groovy
  au BufNewFile,BufRead Dockerfile-dev setf dockerfile
  au BufNewFile,BufRead Podfile setf ruby
endif

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
fun! s:Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  retu result
endf

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
fun! s:IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  exe a:line1 . ',' .
        \ a:line2 . 's/^\s\+/\=<SID>Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endf

command! -nargs=? -range=% SpacesToTabs call <SID>IndentConvert(<line1>, <line2>, 0, <q-args>)
command! -nargs=? -range=% TabsToSpaces call <SID>IndentConvert(<line1>, <line2>, 1, <q-args>)
command! -nargs=? -range=% RetabIndent call <SID>IndentConvert(<line1>, <line2>, &et, <q-args>)

fun! WhatIsThisColour()
  echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endf

fun! WhatIsThisSyntax()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endf

fun! ShowAllColours()
  so $VIMRUNTIME/syntax/hitest.vim
endf

" yanks path to the clipboard
fun! Main__YankPath(absolute)
  let path = expand(a:absolute ? '%:p' : '%')
  let @+ = path
  echo path
endf

" Shortcut to save
fun! Main__SafeSave()
  let folder = expand('%:p:h')
  if folder =~? '^/Applications/Xcode.app/' || folder =~? '^/usr/local/'
    echo 'Unable to save: saving is disabled inside Xcode.app'
  elseif folder =~? '^/usr/local/'
    echo 'Unable to save: saving is disabled indside /urs/local/'
  else
    silent exe 'w'
  endif
endf

" Change cursor shape between insert and normal mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" use ag for searches
let g:ackprg = 'ag --ignore-case --ignore-dir={.git,node_modules,Pods,coverage,docs,obj} --literal --hidden'

" use ag but only return one match per file
fun! Main__searchContentAndShowFiles(...)
  if len(a:000) == 0
    echo 'No search input'
    return
  endif
  let error_file = tempname()
  let pattern = substitute(join(a:000, ' '), "\"", '\\\"', "g")
  let search = "\"" . pattern . "\""
  silent exe '!' . g:ackprg . " --print0 --files-with-matches " .
        \ search . " | xargs -0 file | sed 's/:/:1:/' > " . error_file
  set errorformat=%f:%l:%m
  exe "cg ". error_file
  botright cope
  call delete(error_file)
  redraw!
  echo 'Search results for "' . pattern . '"'
endf
command! -nargs=* Search call Main__searchContentAndShowFiles(<f-args>)

fun! s:isQuickfixOpen()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') ==# 'quickfix'
      retu i
    endif
  endfor
endf

fun! Main__enterAndExitQuickfix()
  if <SID>isQuickfixOpen()
    exe "normal \<c-w>j"
  else
    botright cope
    wincmd p
  endif
endf

fun! Main__closeQuickfix()
  if <SID>isQuickfixOpen()
    ccl
    lcl
  endif
endf

vertical topleft cwindow

fun! Main__toggleLocationList()
  if <SID>isQuickfixOpen()
    ccl
    lcl
  else
    ccl
    lope
    wincmd p
  endif
endf

fun! Main__closeFloatingWindow()
  let wins = nvim_tabpage_list_wins(0)
  for i in wins
    let win_conf = nvim_win_get_config(i)
    if win_conf.relative == 'win'
      call nvim_win_close(i, 0)
    endif
  endfor
  " let bufs
endf

fun! Main__reloadAndRedraw()
  call Main__closeFloatingWindow()
  edit!
  redraw!
endf

" ensure that the quickfix window is always at the bottom
augroup DragQuickfixWindowDown
  autocmd!
  autocmd FileType qf wincmd J
augroup end

" ensure that the last window is not closed with <c-w>c
fun! Main__safeClose()
  if &ft == '' && bufname('') == ''
    echo 'Close window disabled for empty buffers'
    retu
  endif

  if &ft == 'qf' || &ft == 'nerdtree' || &ft == 'help'
    wincmd c
    retu
  endif

  let l:w = winnr('$')
  for winnr in range(1, winnr('$'))
    " substract the quickfix window and location list
    if getwinvar(winnr, '&syntax') == 'qf'
      let l:w -= 1
    endif
  endfor
  " substract one if the nerdtree is open
  if exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
    let l:w -= 1
  endif

  if l:w > 1
    wincmd c
  else
    echo 'Unable to close last window'
  endif
endf

" call to get content of syntax element under cursor
fun! ShowSyntax()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endf

" disable latex symbol conversion
let g:tex_conceal = ""

" easyclip
" --------

let g:EasyClipUseCutDefaults = 0

" indentLine
" ----------

let g:indentLine_fileTypeExclude = ['nerdtree', 'qf', '']
let g:indentLine_color_term = 242
" avoids conceallevel in markdown files
au FileType markdown let g:indentLine_enabled=0

" editorconfig
" ------------

let g:EditorConfig_max_line_indicator = "none"

" nerdcommenter
" ------------

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

" javascript
" ----------

let g:javascript_plugin_flow = 1

" java
" ----
let java_highlight_functions = 1
let java_highlight_all = 1

hi link javaScopeDecl Statement
hi link javaType Type
hi link javaDocTags PreProc

hi link javaExternal Statement

" jsx
" ---

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" typescript
" ----------

let g:typescript_indent_disable = 1

" markdown
" --------

let g:vim_markdown_folding_disabled = 1

" disable conceal when in regular markdown files but allow
" concealing in preview windows for the type info sysntax formatting
au FileType markdown if &pvw == 1 | setlocal conceallevel=2 | else | setlocal conceallevel=0 | endif

hi mkdHeading guifg=#00d7ff
hi htmlH1 guifg=#00d7ff
hi htmlH2 guifg=#00d7ff
hi htmlH3 guifg=#00d7ff
hi htmlH4 guifg=#00d7ff
hi htmlH5 guifg=#00d7ff
hi htmlH6 guifg=#00d7ff

" json
" ----

let g:vim_json_syntax_conceal = 0

" gitgutter
" ---------

set updatetime=100
let g:gitgutter_override_sign_column_highlight = 0

set signcolumn=yes
hi SignColumn guibg=NONE

hi GitGutterAdd guifg=#00cd00
hi GitGutterChange guifg=#00cdcd
hi GitGutterDelete guifg=#ff0000
hi GitGutterChangeDelete guifg=#ff0000

let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_modified_removed = '│'

let g:gitgutter_map_keys = 0

