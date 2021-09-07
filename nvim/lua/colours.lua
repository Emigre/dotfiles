-- colours
vim.cmd [[
  syntax enable
  colorscheme zenburn

  hi SpecialKey guifg=#808080 " tabs character
  hi IncSearch guibg=#87af87 gui=NONE " bright green background for search matches when typing the search
  hi Search guifg=#000000 guibg=#87af87 " color for search matches across the file and selected item in the quickfix
  hi qfFileName guifg=#87afaf
  hi MatchParen guibg=NONE guifg=#00cd00 " Color of matching brackets
  hi NormalFloat guifg=#87af87 guibg=#000000 " Color of floating window
]]

-- syntax adjustments per file type
vim.cmd [[
  au Filetype groovy setlocal ts=4 sts=4 sw=4 et
  au Filetype groovy syn clear groovyUserLabel " fixes weird underline problem in the groovy syntax
  au Filetype java setlocal ts=4 sw=4 et
  au Filetype java syn clear javaUserLabel " also fixes weird underline problem in the java syntax
  au FileType json syntax match Comment +\/\/.\+$+
  au FileType make set noexpandtab sw=4 sts=4
  au Filetype python setlocal ts=4 sts=4 sw=4 et
  au Filetype swift setlocal ts=4 sts=4 sw=4 et
  au Filetype objc setlocal ts=4 sts=4 sw=4 et
  au Filetype objcpp setlocal ts=4 sts=4 sw=4 et
  au Filetype tags setlocal ts=32
  au Filetype tags setlocal nowrap
  au Filetype xml setlocal ts=4 sts=4 sw=4 et
  au Filetype yaml syn clear yamlBlockCollectionItemStart " fixes weird underline problem in the yaml syntax
]]
