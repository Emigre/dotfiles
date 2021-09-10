local map = vim.api.nvim_set_keymap

map('n', 'r', ':call ReloadAndRedraw()<CR>', { noremap = true })

vim.cmd [[
  fun! CloseFloatingWindow()
    let wins = nvim_tabpage_list_wins(0)
    for i in wins
      let win_conf = nvim_win_get_config(i)
      if win_conf.relative == 'win'
        call nvim_win_close(i, 0)
      endif
    endfor
    " let bufs
  endf

  fun! ReloadAndRedraw()
    call CloseFloatingWindow()
    edit!
    redraw!
  endf
]]
