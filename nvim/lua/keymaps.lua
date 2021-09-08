local map = vim.api.nvim_set_keymap

-- buffers
map('n', 'q', ':silent! Bclose<CR>', { silent = true })
map('n', 'Q', ':BufOnly<CR>', { silent = true })
map('n', 'l', ':bn<CR>', { silent = true, noremap = true })
map('n', 'h', ':bp<CR>', { silent = true, noremap = true })

