set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'sickill/vim-monokai'
Plugin 'vim-scripts/Zenburn'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'groenewege/vim-less'
Plugin 'scrooloose/nerdcommenter'
Plugin 'svermeulen/vim-easyclip'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ap/vim-buftabline'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tommcdo/vim-fugitive-blame-ext'
Plugin 'godlygeek/csapprox'
Plugin 'Emigre/vim-javascript'
Plugin 'Emigre/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Yggdroot/indentLine'
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'w0rp/ale'
Plugin 'ludovicchabant/vim-gutentags'

" All of your Plugins must be added before the following line
call vundle#end()


" Vim config
" ----------
"
set autoread
set ruler
set rulerformat=%l,%c%=%P
set noswapfile

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

autocmd Filetype java setlocal ts=4 sw=4 expandtab
autocmd Filetype haskell setlocal ts=4 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab

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

" Automatically removes all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

" Set a character for the tabs
set listchars=tab:\▹\ "
set list
hi SpecialKey ctermfg=8

" maps
function! MySearch(searchText, searchForward, mode)
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
endfunction

" searches for end of paragraph (blank line)
nnoremap <C-f> }
vnoremap <C-f> }
nnoremap <C-e> {
vnoremap <C-e> {
" move the <C-e> fucntionality to <C-v>
nnoremap <c-v> <c-e>
nnoremap <c-v> <c-e>

" searches for parenthesis
nnoremap <silent> ) :call MySearch("(", 1, " ")<CR>
vnoremap <silent> ) :<C-u>call MySearch("(", 1, "gvh ")<CR>
nnoremap <silent> ( :call MySearch("(", 0, " ")<CR>
vnoremap <silent> ( :<C-u>call MySearch("(", 0, "gvh ")<CR>

" searches for curly bracket
nnoremap <silent> + :call MySearch("{", 1, " ")<CR>
vnoremap <silent> + :<C-u>call MySearch("{", 1, "gv ")<CR>
nnoremap <silent> _ :call MySearch("{", 0, " ")<CR>
vnoremap <silent> _ :<C-u>call MySearch("{", 0, "gv ")<CR>

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
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Font and font size
" https://github.com/andreberg/Meslo-Font
" To show current font use :set guifont?
if has("win32") || has("win16")
  set guifont=Meslo\ LG\ M:h9
else
  set guifont=Meslo\ LG\ M:h12
endif

if has("win32") || has("win16")
  set guioptions-=m  "remove menu bar (Windows)
  set guioptions-=T  "remove toolbar (Windows)
endif

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
autocmd! GUIEnter * set vb t_vb=
" Don’t show the intro message when starting Vim
set shortmess=atI

" tell vim to use an undo file
set undofile

" Centralize backups, swapfiles and undo history
" To create directories for backups, colors, swaps and undo.
" $ cd ~/.vim ; mkdir backups ; mkdir colors ; mkdir swaps; mkdir undo;
if has("win32") || has("win16")
else
  set backupdir=~/.vim/backups
  set directory=~/.vim/swaps
  if exists("&undodir")
    set undodir=~/.vim/undo
  endif
endif

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

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

" yanks filename to the clipboard
nnoremap <leader>y :let @+ = expand('%:p')<CR>

" Terminal vim on OSX doesn't let you use <Ctrl-6>
nnoremap <silent> § :b#<CR>

" Switch between matching braces
nnoremap <silent> Q %

" Redraw the screen
nnoremap <silent> ± :redraw!<CR>

" Shortcut to save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Enable / disable highlight of searches
map <silent> ; :set hlsearch!<cr>
:set nohlsearch
hi Search ctermfg=black ctermbg=108

" Color of matching brackets
hi MatchParen ctermbg=none ctermfg=green

" Enter insert mode on click
nnoremap <RightMouse> i<LeftMouse>
autocmd FileType nerdtree nnoremap <buffer> <RightMouse> <RightMouse>
autocmd BufReadPost quickfix nnoremap <buffer> <RightMouse> <RightMouse>

" Change cursor shape between insert and normal mode in iTerm2
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
