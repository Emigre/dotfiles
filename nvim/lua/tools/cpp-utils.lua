local map = vim.api.nvim_set_keymap

map('n', '<leader>H', 'call CppSwitchBetweenHeaderAndImplementation()<CR>', { noremap = true })

vim.cmd [[
  fun! CppSwitchBetweenHeaderAndImplementation()
    if match(expand('%'), '\.\(c\|cc\|cpp\)$') > 0
      let target = 'header'
      let search_pattern = substitute(expand('%:t'), '\.c\(.*\)$', '.h*', '')
    elseif match(expand('%'), '\.m$') > 0
      let target = 'header'
      let search_pattern = substitute(expand('%:t'), '\.m$', '.h*', '')
    elseif match(expand('%'), '\.\(h\|hpp\)$') > 0
      let target = 'implementation'
      let search_pattern = substitute(expand('%:t'), '\.h\(.*\)$', '.c*', '')
    else
      echo 'Failed to switch to header or implementation for this file'
      retu
    endif
    let dir_name = fnamemodify(expand('%:p'), ':h')
    let cmd = 'find ' . dir_name .  ' . -type f ' .
          \ '-iname ' . search_pattern . ' -print -quit'
    let file_name = substitute(system(cmd), '\n$', '', '')
    if filereadable(file_name)
      exe 'e ' file_name
    else
      echo 'No ' . target . ' file found for ' . expand('%:t')
    endif
  endfun
]]

map('n', '<leader>i', ':Include<space>', { noremap = true })

vim.cmd [[
  fun! CppAddInclude(...)
    let include_item = ''
    if a:0
      if match(a:0, '\.\(h\|hpp\)$') > 0
        let include_item = '"' . a:1 . '"'
      else
        let include_item = '<' . a:1 . '>'
      endif
    else
      let path = expand('%')
      if match(path, '\.\(c\|cc\|cpp\)$') > 0
        let file_path = substitute(path, '^\/Users[^/]\+\/code\/[^/]\+\/', '', '')
        file_path = substitute(file_path, '^src\/', '', '')
        let header_path = substitute(file_path, '\.\(c\|cc\|cpp\)$', '.h', '')
        let include_item = '"' . header_path . '"'
      endif
    endif
    if include_item != ''
      echo include_item
      exe 'normal! gg}k'
      call append(line('.'), '#include ' . include_item)
      exe 'normal jj'
    endif
  endf

  command! -nargs=* Include call CppAddInclude(<f-args>)
]]

-- map('n', '<leader>r', 'call CppCompileAndRun()<CR>', { noremap = true })
--
-- vim.cmd [[
--   fun! CppCompileAndRun()
--     if (&ft=='c' || &ft=='cpp')
--       execute "silent !tmux send -t -1 'make && find . -maxdepth 1 -perm -111 -type f | bash' ENTER"
--     endif
--   endfun
-- ]]

-- requires vim-headerguard (not installed at the moment)
-- vim.cmd [[
--   fun! g:HeaderguardName()
--     let l:path = expand('%:s$^\(src\|include\)/$$')
--     retu toupper(substitute(l:path, '[^0-9a-zA-Z_]', '_', 'g')) . '_'
--   endf
--
--   fun! g:HeaderguardLine1()
--     retu "#ifndef " . g:HeaderguardName()
--   endf
--
--   fun! g:HeaderguardLine2()
--     retu "#define " . g:HeaderguardName()
--   endf
--
--   fun! g:HeaderguardLine3()
--     retu "#endif  // " . g:HeaderguardName()
--   endf
--
--   fun! ApplyHeaderguardIfNoGuardsInTheFile()
--     if !search('^#\(ifndef \|pragma once\)', 'nw')
--       HeaderguardAdd
--     end
--   endf
--
--   au BufWritePre *.h,*.hpp silent! call ApplyHeaderguardIfNoGuardsInTheFile()
-- ]]
