local map = vim.api.nvim_set_keymap

map('n', '<leader>p', ':call YankPath(0)<CR>', { silent = true, noremap = true })
map('n', '<leader>P', ':call YankPath(1)<CR>', { silent = true, noremap = true })

vim.cmd [[
  fun! YankPath(absolute)
    let path = expand(a:absolute ? '%:p' : '%')
    let @+ = path
    echo path
  endf
]]
