local map = vim.api.nvim_set_keymap

vim.g.EasyClipUseCutDefaults = 0

map('n', 'K', '<Plug>MoveMotionPlug', {})
map('x', 'K', '<Plug>MoveMotionXPlug', {})
map('n', 'KK', '<Plug>MoveMotionLinePlug', {})
