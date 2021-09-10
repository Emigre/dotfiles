vim.cmd [[
  fun! WhatIsThisColour()
    echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
  endf
]]

vim.cmd [[
  fun! WhatIsThisSyntax()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endf
]]

vim.cmd [[
  fun! ShowAllColours()
    so $VIMRUNTIME/syntax/hitest.vim
  endf
]]
