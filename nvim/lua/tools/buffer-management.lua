local map = vim.api.nvim_set_keymap

-- use l and h to move through the buffers
map('n', 'l', ':bn<CR>', { silent = true, noremap = true })
map('n', 'h', ':bp<CR>', { silent = true, noremap = true })

-- exclude quickfix buffer from :bn :bp
vim.cmd [[
  au FileType qf set nobuflisted
]]

map('n', 'q', ':silent! Bclose<CR>', { silent = true })

vim.cmd [[
  " BufOnly.vim  -  Delete all the buffers except the current/named buffer.
  " Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
  " Distributed under the terms of the Vim license.  See ":help license".

  fun! BufOnly(buffer, bang)
    call Main__closeFloatingWindow()

    if a:buffer == ''
      " No buffer provided, use the current buffer.
      let buffer = bufnr('%')
    elseif (a:buffer + 0) > 0
      " A buffer number was provided.
      let buffer = bufnr(a:buffer + 0)
    else
      " A buffer name was provided.
      let buffer = bufnr(a:buffer)
    endif

    if buffer == -1
      echohl ErrorMsg
      echomsg "No matching buffer for" a:buffer
      echohl None
      retu
    endif

    let last_buffer = bufnr('$')

    let delete_count = 0
    let n = 1
    while n <= last_buffer
      if n != buffer && buflisted(n)
        if a:bang == '' && getbufvar(n, '&modified')
          echohl ErrorMsg
          echomsg 'No write since last change for buffer'
                \ n '(add ! to override)'
          echohl None
        else
          silent exe 'bdel' . a:bang . ' ' . n
          if ! buflisted(n)
            let delete_count = delete_count+1
          endif
        endif
      endif
      let n = n+1
    endwhile

    if delete_count == 1
      echomsg delete_count "buffer deleted"
    elseif delete_count > 1
      echomsg delete_count "buffers deleted"
    endif

  endf

  command! -nargs=? -complete=buffer -bang BufOnly :call BufOnly('<args>', '<bang>')
]]

map('n', 'Q', ':BufOnly<CR>', { silent = true })

vim.cmd [[
  " Delete buffer while keeping window layout (don't close buffer's windows).
  " Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
  if v:version < 700 || exists('loaded_bclose') || &cp
    echo 'Error: Bclose loaded multiple times'
  endif
  let loaded_bclose = 1
  if !exists('bclose_multiple')
    let bclose_multiple = 1
  endif

  " Display an error message.
  function! BcloseWarn(msg)
    echohl ErrorMsg
    echomsg a:msg
    echohl NONE
  endfunction

  " Command ':Bclose' executes ':bd' to delete buffer in current window.
  " The window will show the alternate buffer (Ctrl-^) if it exists,
  " or the previous buffer (:bp), or a blank buffer if no previous.
  " Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
  " An optional argument can specify which buffer to close (name or number).
  fun! Bclose(bang, buffer)
    call Main__closeFloatingWindow()

    if empty(a:buffer)
      let btarget = bufnr('%')
    elseif a:buffer =~ '^\d\+$'
      let btarget = bufnr(str2nr(a:buffer))
    else
      let btarget = bufnr(a:buffer)
    endif
    if btarget < 0
      call BcloseWarn('No matching buffer for '.a:buffer)
      retu
    endif
    if empty(a:bang) && getbufvar(btarget, '&modified')
      call BcloseWarn('No write since last change for buffer '.btarget.' (use :Bclose!)')
      retu
    endif
    " Numbers of windows that view target buffer which we will delete.
    let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
    if !g:bclose_multiple && len(wnums) > 1
      call BcloseWarn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
      retu
    endif
    let wcurrent = winnr()
    for w in wnums
      exe w.'wincmd w'
      let prevbuf = bufnr('#')
      if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
        buffer #
      else
        bprevious
      endif
      if btarget == bufnr('%')
        " Numbers of listed buffers which are not the target to be deleted.
        let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
        " Listed, not target, and not displayed.
        let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
        " Take the first buffer, if any (could be more intelligent).
        let bjump = (bhidden + blisted + [-1])[0]
        if bjump > 0
          exe 'buffer '.bjump
        else
          exe 'enew'.a:bang
        endif
      endif
    endfor
    exe 'bdelete'.a:bang.' '.btarget
    exe wcurrent.'wincmd w'
  endf

  command! -bang -complete=buffer -nargs=? Bclose call Bclose('<bang>', '<args>')
]]
