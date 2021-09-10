local map = vim.api.nvim_set_keymap

-- ensure that the quickfix window is always at the bottom
vim.cmd [[
  autocmd FileType qf wincmd J
]]

-- close with q when inside the quickfix
vim.cmd [[
  au BufReadPost quickfix nnoremap <silent> <buffer> q <C-w>c
]]

-- disable buffer navigation inside of the quickfix and assign l to 'open'
vim.cmd [[
  au BufReadPost quickfix nnoremap <silent> <buffer> h <Nop>
  au BufReadPost quickfix nnoremap <silent> <buffer> l <CR>
]]

vim.cmd [[
  fun! IsQuickfixOpen()
    for i in range(1, winnr('$'))
      let bnum = winbufnr(i)
      if getbufvar(bnum, '&buftype') ==# 'quickfix'
        retu i
      endif
    endfor
  endf
]]

-- enter and exit quickfix window
map('n', '<leader>w', ':silent! call EnterAndExitQuickfix()<CR>', { silent = true, noremap = true })
vim.cmd [[
  au BufReadPost quickfix nnoremap <silent> <buffer> <leader>w <C-w>k
]]

vim.cmd [[
  fun! EnterAndExitQuickfix()
    if IsQuickfixOpen()
      exe "normal \<c-w>j"
    else
      botright cope
      wincmd p
    endif
  endf
]]

-- toggle quickfix window
map('n', '<leader>W', ':silent! call CloseQuickfix()<CR>', { silent = true, noremap = true })

vim.cmd [[
  fun! CloseQuickfix()
    if <SID>isQuickfixOpen()
      ccl
      lcl
    endif
  endf
]]

-- toggle location window
map('n', '<leader>L', ':silent! call ToggleLocationList()<CR>', { noremap = true })

vim.cmd [[
  fun! ToggleLocationList()
    if IsQuickfixOpen()
      ccl
      lcl
    else
      ccl
      lope
      wincmd p
    endif
  endf
]]
