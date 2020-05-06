set nocompatible
set nomodeline
filetype off

call plug#begin('~/.vim/plugged')

" Simplified clipboard
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-repeat'

" Editorconfig integration
Plug 'editorconfig/editorconfig-vim'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'

call plug#end()

set autoread
set ruler
set rulerformat=%l,%c%=%P
set noswapfile
set nofoldenable

" leader key
let mapleader = "\<Space>"

colorscheme Zenburn

" indentation
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
set smartindent

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

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

" Set a character for the tabs
set listchars=nbsp:␣,tab:\᠁\ "
set list
hi SpecialKey ctermfg=244

" bright green background for search matches when typing the search
hi IncSearch cterm=NONE ctermbg=green

" color for search matches across the file and selected item in the quickfix
hi Search ctermfg=black ctermbg=108
hi qfFileName ctermfg=109

" Color of matching brackets
hi MatchParen ctermbg=none ctermfg=green

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

" Font and font size
" https://github.com/andreberg/Meslo-Font
" To show current font use :set guifont?
set guifont=Meslo\ LG\ M:h12

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

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Change cursor shape between insert and normal mode in iTerm2
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Enable or disable highlight of searches
map <silent> § :set hlsearch!<cr>

" Shortcut to substitute
nnoremap <leader>s :%s/\c//gc<Left><Left><Left><Left>

" easyclip
let g:EasyClipUseCutDefaults = 0
nmap K <Plug>MoveMotionPlug
xmap K <Plug>MoveMotionXPlug
nmap KK <Plug>MoveMotionLinePlug

" Save
nnoremap <silent> s :w<CR>

" makes j and k do a page up and down
nnoremap j <C-d>
vnoremap j <C-d>
nnoremap k <C-u>
vnoremap k <C-u>

" editorconfig
let g:EditorConfig_max_line_indicator = "none"
