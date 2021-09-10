local map = vim.api.nvim_set_keymap

map('', '<leader>h', ':set hlsearch!<CR>', { silent = true })
map('n', '<C-v>', '<C-e>', { noremap = true }) -- move the <C-e> fucntionality (scroll screen down) to <C-v>
map('n', '<leader>R', 'R', { silent = true, noremap = true }) -- replace text as you type
map('n', '<leader>q', 'q', { noremap = true }) -- remap record macro as q is used for closing
map('n', '<leader>s', ':%s/c//gc<Left><Left><Left><Left>', { noremap = true })

-- use S and U to search for end of paragraph (blank line)
map('n', 'S', '}', { noremap = true })
map('n', 'U', '{', { noremap = true })
map('v', 'S', '}', { noremap = true })
map('v', 'U', '{', { noremap = true })
