local map = vim.api.nvim_set_keymap

map('n', 's', ':call SafeSave()<CR>', { silent = true, noremap = true })

vim.cmd [[
  fun! SafeSave()
    let folder = expand('%:p:h')
    if folder =~? '^/Applications/Xcode.app/' || folder =~? '^/usr/local/'
      echo 'Unable to save: saving is disabled inside Xcode.app'
    elseif folder =~? '^/usr/local/'
      echo 'Unable to save: saving is disabled indside /urs/local/'
    else
      silent exe 'w'
    endif
  endf
]]
