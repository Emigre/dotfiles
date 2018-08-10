set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'bfrg/vim-cpp-modern'
Plug 'editorconfig/editorconfig-vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vinarise.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/Zenburn'
Plug 'Yggdroot/indentLine'

Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for':['javascript', 'javascript.jsx'] }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }

Plug 'w0rp/ale', {
      \ 'for': [
      \ 'c',
      \ 'clojure',
      \ 'cpp',
      \ 'go',
      \ 'haskell',
      \ 'java',
      \ 'javascript',
      \ 'javascript.jsx',
      \ 'python',
      \ 'rust',
      \ 'typescript',
      \ ]
      \}

Plug 'Valloric/YouCompleteMe', {
      \ 'for': [
      \ 'c',
      \ 'clojure',
      \ 'cpp',
      \ 'go',
      \ 'java',
      \ 'javascript',
      \ 'javascript.jsx',
      \ 'python',
      \ 'rust',
      \ 'typescript',
      \ ]
      \ }

call plug#end()

set autoread
set ruler
set rulerformat=%l,%c%=%P
set noswapfile
set nofoldenable

" Enable project-specific .vimrc files
set exrc
set secure

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

aug TabSettings
  au!
  au Filetype java setlocal ts=4 sw=4 et
  au Filetype haskell setlocal ts=4 sw=4 et
  au Filetype python setlocal ts=4 sts=4 sw=4 et
  au Filetype tags setlocal ts=32
  au Filetype tags setlocal nowrap
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

" Automatically removes all trailing whitespace on save
au BufWritePre * :silent %s/\s\+$//e

" Automatically substitutes any no-break spaces (U+00A0) with
" regular spaces (U+0020) on save
au BufWritePre * :silent %s/\%u00A0/ /e

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

" Set a character for the tabs
set listchars=nbsp:␣,tab:\▹\ "
set list
hi SpecialKey ctermfg=8

fun! s:mySearch(searchText, searchForward, mode)
  let command = a:searchForward ? "/" : "?"
  let search = join(["normal! ", a:mode, command, a:searchText, "\<CR>"], "")
  set whichwrap+=h,l
  set nowrapscan
  try
    silent execute search
  catch
    echo v:exception[17:]
  endtry
  set whichwrap-=h,l
  set wrapscan
endf

" searches for end of paragraph (blank line)
nnoremap <C-f> }
vnoremap <C-f> }
nnoremap <C-e> {
vnoremap <C-e> {

" move the <C-e> fucntionality to <C-v>
nnoremap <c-v> <c-e>
nnoremap <c-v> <c-e>

" searches for curly bracket
nnoremap <silent> } :call <SID>mySearch('{', 1, ' ')<CR>
vnoremap <silent> } :<C-u>call <SID>mySearch('{', 1, 'gv ')<CR>
nnoremap <silent> { :call <SID>mySearch('{', 0, ' ')<CR>
vnoremap <silent> { :<C-u>call <SID>mySearch('{', 0, 'gv ')<CR>

" Insert a new line without entering insert mode
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

" bright color for search matches
hi IncSearch cterm=NONE ctermbg=green

" Set some commands that I often write in a wrong way by mistake
command Q q
command Qa qa
command W w
command Wq wq
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

" Font and font size
" https://github.com/andreberg/Meslo-Font
" To show current font use :set guifont?
set guifont=Meslo\ LG\ M:h12

" status line
set statusline=%m        "modified flag
set statusline+=%=       "left/right separator
set statusline+=%l,      "cursor line
set statusline+=%c       "cursor column
set statusline+=\ %P     "percent through file

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
set esckeys
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Enable mouse in all modes
set mouse=a
set ttymouse=xterm2
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

" Centralize backups, swapfiles and undo history
" To create directories for backups, colors, swaps and undo.
" $ cd ~/.vim ; mkdir backups ; mkdir colors ; mkdir swaps; mkdir undo;
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Automatic commands
if has('autocmd')
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  au BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
fun! Indenting(indent, what, cols)
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
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction

command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

" to show all available colors:
" :so $VIMRUNTIME/syntax/hitest.vim

" yanks path to the clipboard
nnoremap <silent> <leader>y :let @+ = expand('%')<CR>

" yanks full path to the clipboard
nnoremap <silent> <leader>Y :let @+ = expand('%:p')<CR>

" Terminal vim on OSX doesn't let you use <Ctrl-6>
nnoremap <silent> § :b#<CR>

" Switch between matching braces
nnoremap <silent> Q %

" Redraw the screen
nnoremap <silent> ± :redraw!<CR>

" Shortcut to save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Enable or disable highlight of searches
map <silent> ' :set hlsearch!<cr>
:set nohlsearch
hi Search ctermfg=black ctermbg=108

" Color of matching brackets
hi MatchParen ctermbg=none ctermfg=green

" Change cursor shape between insert and normal mode in iTerm2
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" use ag for searches
let g:ackprg = 'ag --ignore-case --ignore-dir={.git,node_modules,docs} --vimgrep --hidden'

" Shortcut to substitute
nnoremap <leader>x :%s/\c//gc<Left><Left><Left><Left>

" use ag but only return one match per file
fun! s:searchContentAndShowFiles(pattern, ...)
  let error_file = tempname()
  let path = a:0 < 1 ? '' : a:1
  let search = substitute(a:pattern, "\'", "\\\\x27", "g")
  silent exe '!' . g:ackprg . " --print0 --files-with-matches '" .
        \ search . "' " . path . " | xargs -0 file | sed 's/:/:1:/' > " . error_file
  set errorformat=%f:%l:%m
  exe "cg ". error_file
  botright cope
  call delete(error_file)
  redraw!
endf
command! -nargs=* Search call <SID>searchContentAndShowFiles(<f-args>)
nnoremap <leader>s :Search<space>

" search for text in files, populate the quickfix list with them and run replace on it
fun! s:searchContentAndReplace(pattern, newpattern, ...)
  let error_file = tempname()
  let path = a:0 < 1 ? '' : a:1
  let search = substitute(a:pattern, "\'", "\\\\x27", "g")
  silent exe '!' . g:ackprg . " --print0 --files-with-matches '" .
        \ search . "' " . path . " | xargs -0 file | sed 's/:/:1:/' > " . error_file
  set errorformat=%f:%l:%m
  exe "cg ". error_file
  botright cope
  call delete(error_file)
  redraw!
  exe 'cdo %s/\v\c' . a:pattern . '/' . a:newpattern . '/gci | update'
endf
command! -nargs=* Replace call <SID>searchContentAndReplace(<f-args>)
nnoremap <leader>r :Replace<space>

" find files by filename and populate the quickfix list with them
fun! s:findFilesByFileName(filename, ...)
  let error_file = tempname()
  let path = a:0 < 1 ? '.' : a:1
  silent exe '!find ' . path . ' -type d ' .
        \ '\( -path .*/node_modules -o -path .*/.git -o -path .*/bower_components \) ' .
        \ '-prune -o -iname "' . a:filename . '" -print0 ' .
        \ '| xargs -0 file | sed "s/:/:1:/" > ' . error_file
  set errorformat=%f:%l:%m
  exe "cg ". error_file
  copen
  call delete(error_file)
  redraw!
endf
command! -nargs=* Find call <SID>findFilesByFileName(<f-args>)
nnoremap <leader>f :Find<space>

fun! s:isQuickFixOpen()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') ==# 'quickfix'
      retu i
    endif
  endfor
endf

fun! s:enterAndExitQuickFix()
  echo &buftype
  if &buftype ==# 'quickfix'
    exe 'wincmd k'
    exe 'wincmd l'
  else
    let quickfixwindow = s:isQuickFixOpen()
    if quickfixwindow
      exe quickfixwindow 'wincmd w'
    else
      cope
    endif
  endif
endf

fun! s:toggleQuickFix()
  if <SID>isQuickFixOpen()
    ccl
  else
    cope
  endif
endf

nnoremap <silent> <leader>m :call <SID>toggleQuickFix()<CR>
nnoremap <silent> <CR> :call <SID>enterAndExitQuickFix()<CR>

aug MyQuickfixMaps
  au!
  au BufReadPost quickfix nnoremap <silent> <buffer> <C-X> :ccl<CR>
  au BufReadPost quickfix nnoremap <silent> <buffer> <C-C> <C-C>
  au BufReadPost quickfix nnoremap <silent> <buffer> <C-j> <C-w>k
  au BufReadPost quickfix nnoremap <silent> <buffer> <C-k> k
  au BufReadPost quickfix nnoremap <silent> <buffer> o <CR>
  au BufReadPost quickfix nnoremap <silent> <buffer> <CR> :call <SID>enterAndExitQuickFix()<CR>
  au FileType vimfiler nnoremap <silent> <buffer> <CR> :call <SID>enterAndExitQuickFix()<CR>
aug END

map <ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-D>

fun! s:SwitchBetweenHeaderAndImplementation()
  if match(expand('%'), '\.\(c\|cc\|cpp\)$') > 0
    let target = 'header'
    let search_pattern = substitute(expand('%:t'), '\.c\(.*\)$', '.h*', '')
  elseif match(expand('%'), '\.\(h\|hpp\)$') > 0
    let target = 'implementation'
    let search_pattern = substitute(expand('%:t'), '\.h\(.*\)$', '.c*', '')
  else
    retu
  endif
  let dir_name = fnamemodify(expand('%:p'), ':h')
  let cmd = 'find ' . dir_name .  ' . -type f ' .
        \ '-iname ' . search_pattern . ' -print -quit'
  let file_name = substitute(system(cmd), '\n$', '', '')
  if filereadable(file_name)
    exe 'e ' file_name
  else
    echo 'No ' . target . ' file found for ' . expand('%:t')
  endif
endfun

nnoremap <leader>] :call <SID>SwitchBetweenHeaderAndImplementation()<CR>
