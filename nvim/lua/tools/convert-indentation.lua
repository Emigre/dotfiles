-- return indent (all whitespace at start of a line), converted from
-- tabs to spaces if what = 1, or from spaces to tabs otherwise
-- when converting to tabs, result has no redundant spaces
vim.cmd [[
  fun! Indenting(indent, what, cols)
    let spccol = repeat(' ', a:cols)
    let result = substitute(a:indent, spccol, '\t', 'g')
    let result = substitute(result, ' \+\ze\t', '', 'g')
    if a:what == 1
      let result = substitute(result, '\t', spccol, 'g')
    endif
    retu result
  endf
]]

-- convert whitespace used for indenting (before first non-whitespace).
-- what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
-- cols = string with number of columns per tab, or empty to use 'tabstop'.
-- The cursor position is restored, but the cursor will be in a different
-- column when the number of characters in the indent of the line is changed.
vim.cmd [[
  fun! IndentConvert(line1, line2, what, cols)
    let savepos = getpos('.')
    let cols = empty(a:cols) ? &tabstop : a:cols
    exe a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
    call histdel('search', -1)
    call setpos('.', savepos)
  endf

  command! -nargs=? -range=% SpacesToTabs call IndentConvert(<line1>, <line2>, 0, <q-args>)
  command! -nargs=? -range=% TabsToSpaces call IndentConvert(<line1>, <line2>, 1, <q-args>)
  command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>, <line2>, &et, <q-args>)
]]
