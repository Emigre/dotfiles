" remap record macro as q will be used for closing
noremap <leader>q q
" move the <C-e> fucntionality (scroll screen down) to <C-v>
nnoremap <c-v> <c-e>
nnoremap <c-v> <c-e>
" Yank the path
nnoremap <silent> <leader>p :call Main__YankPath(0)<CR>
nnoremap <silent> <leader>P :call Main__YankPath(1)<CR>
" Enable or disable highlight of searches
map <silent> <leader>h :set hlsearch!<cr>
" Save
nnoremap <silent>s :call Main__SafeSave()<CR>
" Shortcut to substitute
nnoremap <leader>s :%s/\c//gc<Left><Left><Left><Left>
" Search for text in files with ag
nnoremap <leader>a :Search<space>
" keymap to trigger replace text as you type
nnoremap <silent> <leader>R R
" avoid closing the last buffer with <c-w>c
nnoremap <c-w>c :call Main__safeClose()<CR>
" reload screen
nnoremap r :call Main__reloadAndRedraw()<CR>

" disables " searches for end of paragraph (blank line)
nnoremap S }
vnoremap S }
nnoremap U {
vnoremap U {

" easyclip
" --------
nmap K <Plug>MoveMotionPlug
xmap K <Plug>MoveMotionXPlug
nmap KK <Plug>MoveMotionLinePlug

" fugitive
" ---------
nnoremap <leader>g :Git blame<CR>
" close blame window with q
au FileType fugitiveblame nnoremap <silent> <buffer> q <C-w>c
au FileType fugitiveblame nnoremap <silent> <buffer> <leader>g <C-w>c
" disable buffer navigation inside of the blame window
au FileType fugitiveblame nnoremap <silent> <buffer> h <Nop>
au FileType fugitiveblame nnoremap <silent> <buffer> l <Nop>
" close diff window with q
au FileType git nnoremap <silent> <buffer> q :bdelete<CR>
" disable buffer navigation inside of the diff window
au FileType git nnoremap <silent> <buffer> h <Nop>
au FileType git nnoremap <silent> <buffer> l <Nop>

" C++
" ---
nnoremap <leader>i :Include<space>

" Buftabline
" ----------
nmap <silent> q :silent! Bclose<CR>
nmap <silent> Q :BufOnly<CR>
nnoremap <silent> l :bn<CR>
nnoremap <silent> h :bp<CR>

" LSP
" ---
nmap <C-j> :call LSP__NextDiagnosticCycle()<CR>
nmap <C-k> :call LSP__PrevDiagnosticCycle()<CR>

nmap <silent> <leader>D :call LSP__OpenDiagnostics()<CR>
au BufReadPost quickfix nnoremap <silent> <buffer> <leader>D <C-w>c

nmap <silent> <leader>; :call LSP__goToDefinition()<CR>
nnoremap <silent> t :call LSP__showTypeDefinition()<CR>
nnoremap <silent> R :call LSP__showReferences()<CR>

nnoremap <leader>H :call Cpp__switchBetweenHeaderAndImplementation()<CR>
nnoremap <leader>r :call Cpp__CompileAndRun()<CR>

" Ranger
" ------
if !exists('g:ranger_map_keys') || g:ranger_map_keys
  map <leader>f :Ranger<CR>
  map <leader>F :RangerWorkingDirectory<CR>
endif

" NERDTree
" --------
" toggle tree
nnoremap <silent> <leader>E :silent! call NERDTree__toggleTree()<CR>
" locate current file in tree
nnoremap <silent> <leader>d :silent! call NERDTree__syncTree()<CR>
" enter and exit tree
nnoremap <silent> <leader>e :silent! call NERDTree__enterAndExitTree()<CR>
au FileType nerdtree noremap <silent> <buffer> <leader>e <C-w>h
let NERDTreeMapOpenExpl=''
" close with C-x when inside the tree
au FileType nerdtree noremap <silent> <buffer> q :call NERDTree__toggleTree()<CR>
" assign l to 'open'
let NERDTreeMapActivateNode='l'
" assign o to 'open', too
au FileType nerdtree map <silent> <buffer> o <CR>
" disable some keys inside NERDTree
au FileType nerdtree noremap <silent> <buffer> h <Nop>
au FileType nerdtree noremap <silent> <buffer> i <Nop>
au FileType nerdtree noremap <silent> <buffer> s <Nop>
au FileType nerdtree noremap <silent> <buffer> t <Nop>
au FileType nerdtree noremap <silent> <buffer> u <Nop>
" make j and k do just the standard 'up' and 'down'
au FileType nerdtree noremap <silent> <buffer> k <Up>
au FileType nerdtree noremap <silent> <buffer> j <Down>
" disable 'help' to allow searching with ?
let NERDTreeMapHelp='§'
" use . to show filtered files
let NERDTreeMapToggleFilters='.'

" Location and quickfix windows
" -----------------------------
" location window
nnoremap <leader>L :silent! call Main__toggleLocationList()<CR>
" toggle quickfix window
nnoremap <silent> <leader>W :silent! call Main__closeQuickfix()<CR>
" enter and exit quickfix window
nnoremap <silent> <leader>w :silent! call Main__enterAndExitQuickfix()<CR>
au BufReadPost quickfix nnoremap <silent> <buffer> <leader>w <C-w>k
" close with q when inside the quickfix
au BufReadPost quickfix nnoremap <silent> <buffer> q <C-w>c
" disable buffer navigation inside of the quickfix and assign l to 'open'
au BufReadPost quickfix nnoremap <silent> <buffer> h <Nop>
au BufReadPost quickfix nnoremap <silent> <buffer> l <CR>
