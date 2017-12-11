nnoremap <leader>g :Gblame<CR>

aug MyFugitiveMaps
  au!
  au FileType fugitiveblame nnoremap <silent> <buffer> <C-h> <C-w><C-w>
  au FileType fugitiveblame nnoremap <silent> <buffer> <BS> <C-w><C-w>
  au FileType fugitiveblame nnoremap <silent> <buffer> <C-x> :Gblame<CR>
aug END
