local map = vim.api.nvim_set_keymap

-- ensure that the last window is not closed when using <C-w>c
map('n', '<C-w>c', ':call SafeClose()<CR>', { noremap = true })

vim.cmd [[
  fun! SafeClose()
    if &ft == '' && bufname('') == ''
      echo 'Close window disabled for empty buffers'
      retu
    endif

    if &ft == 'qf' || &ft == 'nerdtree' || &ft == 'help'
      wincmd c
      retu
    endif

    let l:w = winnr('$')
    for winnr in range(1, winnr('$'))
      " substract the quickfix window and location list
      if getwinvar(winnr, '&syntax') == 'qf'
        let l:w -= 1
      endif
    endfor
    " substract one if the nerdtree is open
    if exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
      let l:w -= 1
    endif

    if l:w > 1
      wincmd c
    else
      echo 'Unable to close last window'
    endif
  endf
]]
