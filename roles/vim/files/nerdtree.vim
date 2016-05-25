" nerdtree.vim
" ------------
map <silent> <C-w>n :NERDTreeToggle <CR>
map <silent> <C-w>? :NERDTreeFind<CR>
let g:NERDTreeChDirMode=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['^\.git$', '^\.sass-cache$', '^\.DS_Store$', '^\.idea']
