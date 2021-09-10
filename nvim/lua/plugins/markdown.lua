vim.g.vim_markdown_folding_disabled = 1

-- disable conceal when in regular markdown files but allow
-- concealing in preview windows for the type info sysntax formatting
vim.cmd [[
  au FileType markdown if &pvw == 1 | setlocal conceallevel=2 | else | setlocal conceallevel=0 | endif
]]

vim.cmd [[
  hi mkdHeading guifg=#00d7ff
  hi htmlH1 guifg=#00d7ff
  hi htmlH2 guifg=#00d7ff
  hi htmlH3 guifg=#00d7ff
  hi htmlH4 guifg=#00d7ff
  hi htmlH5 guifg=#00d7ff
  hi htmlH6 guifg=#00d7ff
]]
