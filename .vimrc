" Vundle
" ------
" https://github.com/gmarik/Vundle.vim
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins;
"                     append `!` to auto-approve removal"
"
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'sickill/vim-monokai'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'groenewege/vim-less'
Plugin 'scrooloose/nerdcommenter'
Plugin 'svermeulen/vim-easyclip'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'mustache/vim-mustache-handlebars'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" -------------------------------------

" basic config
set autoread
set ruler
set number
" colors
" https://github.com/sickill/vim-monokai
colorscheme monokai
syntax on
" indentation
set smartindent
set shiftwidth=4
set tabstop=4

" Paste mode. Reflowing comment blocks with gq needs nopaste.
" http://stackoverflow.com/questions/8435808/reflowing-comment-blocks-with-vim
" http://blog.ayaz.pk/2008/06/21/paste-mode-pasting-text-and-indenting-it-in-vim/
set nopaste

" Automatically removes all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" maps
map £ #

" Clear search highlight (to show again press n)
nnoremap <esc> :noh<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :write<CR>
vnoremap <C-S> <C-C>:write<CR>
inoremap <C-S> <C-O>:write<CR>

" Fix arrow keys that display A B C D
set t_ku=OA
set t_kd=OB
set t_kr=OC
set t_kl=OD

nnoremap <silent> <ESC>OA k
nnoremap <silent> <ESC>OB j
nnoremap <silent> <ESC>OC l
nnoremap <silent> <ESC>OD h

" Use tab key to switch windows and current file path
nnoremap <Tab> <C-W>W

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

" Always show status line
set laststatus=2
" status line
set statusline=
set statusline+=\[%n\]   "buffer number
set statusline+=\ %f     "file
set statusline+=\ %m     "modified flag
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
" Add the g flag to search/replace by default
set gdefault
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
" Disable all error bells
set noerrorbells
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=
" Don’t show the intro message when starting Vim
set shortmess=atI

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

" Strip trailing whitespace (,ss)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

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

" nerdtree.vim
" ------------
map <C-n> :NERDTreeToggle <CR>
map <C-o> :NERDTreeFind<CR>
let g:NERDTreeChDirMode=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['^\.git$']

" ctrlp.vim
" ---------
if exists("g:ctrl_user_command")
    unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*,*/.svn/*,*/lib/*,*/bower_components/*
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'
" use "filename search" by default
let g:ctrlp_by_filename = 1

" CtrlP root markers (_ctrlp or .ctrlp files)
" https://coderwall.com/p/5xv7sq
if has("win32") || has("win16")
  let g:ctrlp_root_markers = ['_ctrlp']
else
  let g:ctrlp_root_markers = ['.ctrlp']
endif

" Show hidden files
let g:ctrlp_show_hidden = 1

nmap <leader>= :CtrlPClearCache<CR>

" bufexplorer.vim
" ---------------
" Open Buffexplorer
if has("win32") || has("win16")
  nnoremap <silent> <space> :BufExplorer<CR> " Windows
else
  nnoremap <silent> <space> :BufExplorer<CR>
endif

" Wipe out inactive buffers from the buffer list
function! DeleteInactiveBufs()
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()

nmap <leader>- :Bdi<CR>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>

" go to buffer 1, 2, 3, etc
nnoremap <Leader><Leader>1 :1b<CR>
nnoremap <Leader><Leader>2 :2b<CR>
nnoremap <Leader><Leader>3 :3b<CR>
nnoremap <Leader><Leader>4 :4b<CR>
nnoremap <Leader><Leader>5 :5b<CR>
nnoremap <Leader<Leader>>6 :6b<CR>
nnoremap <Leader><Leader>7 :7b<CR>
nnoremap <Leader><Leader>8 :8b<CR>
nnoremap <Leader><Leader>9 :9b<CR>

nnoremap <Leader>10 :10b<CR>
nnoremap <Leader>11 :11b<CR>
nnoremap <Leader>12 :12b<CR>
nnoremap <Leader>13 :13b<CR>
nnoremap <Leader>14 :14b<CR>
nnoremap <Leader>15 :15b<CR>
nnoremap <Leader>16 :16b<CR>
nnoremap <Leader>17 :17b<CR>
nnoremap <Leader>18 :18b<CR>
nnoremap <Leader>19 :19b<CR>

nnoremap <Leader>20 :20b<CR>
nnoremap <Leader>21 :21b<CR>
nnoremap <Leader>22 :22b<CR>
nnoremap <Leader>23 :23b<CR>
nnoremap <Leader>24 :24b<CR>
nnoremap <Leader>25 :25b<CR>
nnoremap <Leader>26 :26b<CR>
nnoremap <Leader>27 :27b<CR>
nnoremap <Leader>28 :28b<CR>
nnoremap <Leader>29 :29b<CR>

nnoremap <Leader>30 :30b<CR>
nnoremap <Leader>31 :31b<CR>
nnoremap <Leader>32 :32b<CR>
nnoremap <Leader>33 :33b<CR>
nnoremap <Leader>34 :34b<CR>
nnoremap <Leader>35 :35b<CR>
nnoremap <Leader>36 :36b<CR>
nnoremap <Leader>37 :37b<CR>
nnoremap <Leader>38 :38b<CR>
nnoremap <Leader>39 :39b<CR>

nnoremap <Leader>40 :40b<CR>
nnoremap <Leader>41 :41b<CR>
nnoremap <Leader>42 :42b<CR>
nnoremap <Leader>43 :43b<CR>
nnoremap <Leader>44 :44b<CR>
nnoremap <Leader>45 :45b<CR>
nnoremap <Leader>46 :46b<CR>
nnoremap <Leader>47 :47b<CR>
nnoremap <Leader>48 :48b<CR>
nnoremap <Leader>49 :49b<CR>

nnoremap <Leader>50 :50b<CR>

" nerdcommenter
" -------------
filetype plugin on

" neocomplcache
" -------------
" Note - This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " Select one of these two lines:
  " This line inserts a <CR> if you press <CR> while selecting
  " return neocomplcache#smart_close_popup() . "\<CR>"
  " This line doesn't insert a <CR> and instead select the option
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
