local map = vim.api.nvim_set_keymap

map('n', '<leader>g', ':Git blame<CR>', { noremap = true })

-- close blame window with q
vim.cmd [[
  au FileType fugitiveblame nnoremap <silent> <buffer> q <C-w>c
  au FileType fugitiveblame nnoremap <silent> <buffer> <leader>g <C-w>c
]]

-- disable buffer navigation inside of the blame window
vim.cmd [[
  au FileType fugitiveblame nnoremap <silent> <buffer> h <Nop>
  au FileType fugitiveblame nnoremap <silent> <buffer> l <Nop>
]]

-- close diff window with q
vim.cmd [[
  au FileType git nnoremap <silent> <buffer> q :bdelete<CR>
]]

-- disable buffer navigation inside of the diff window
vim.cmd [[
  au FileType git nnoremap <silent> <buffer> h <Nop>
  au FileType git nnoremap <silent> <buffer> l <Nop>
]]
