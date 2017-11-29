nnoremap <leader>g :Gblame<CR>

autocmd FileType fugitiveblame map <silent> <buffer> <C-h> <C-w><C-w>
autocmd FileType fugitiveblame map <silent> <buffer> <BS> <C-w><C-w>
autocmd FileType fugitiveblame map <silent> <buffer> <C-x> :Gblame<CR>
