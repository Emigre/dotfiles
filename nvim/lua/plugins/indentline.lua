vim.g.indentLine_color_term = 242
vim.g.indentLine_fileTypeExclude = { 'nerdtree', 'qf', '' }

-- avoids conceallevel in markdown files
vim.cmd [[
  au FileType markdown let g:indentLine_enabled=0
]]
