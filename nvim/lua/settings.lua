vim.g.mapleader = ' '

vim.cmd [[
  filetype plugin indent on
]]

vim.cmd [[
  vertical topleft cwindow
]]

-- some commands that I often write wrong
vim.cmd [[
  command -bang Q q
  command -bang Qa qa
  command W w
  command -bang Wq wq
  command Ccl ccl
]]

-- colours
vim.cmd [[
  syntax enable
  colorscheme zenburn

  hi IncSearch guibg=#87af87 gui=NONE " bright green background for search matches when typing the search
  hi MatchParen guibg=NONE guifg=#00cd00 " Color of matching brackets
  hi NormalFloat guifg=#87af87 guibg=#000000 " Color of floating window
  hi Search guifg=#000000 guibg=#87af87 " color for search matches across the file and selected item in the quickfix
  hi SignColumn guibg=NONE
  hi SpecialKey guifg=#808080 " tabs character
  hi qfFileName guifg=#87afaf
]]

-- file type detection
vim.cmd [[
  au BufNewFile,BufRead *.json setf json syntax=javascript
  au BufNewFile,BufRead Dockerfile-dev setf dockerfile
  au BufNewFile,BufRead Jenkinsfile setf groovy
  au BufNewFile,BufRead Podfile setf ruby
]]

-- detect file type of C++ standard headers
vim.cmd [[
  au BufRead * if search('\M-*- C++ -*-', 'n', 1) | setlocal ft=cpp | endif
]]

-- syntax adjustments per file type
vim.cmd [[
  au filetype groovy setlocal ts=4 sts=4 sw=4 et
  au filetype groovy syn clear groovyUserLabel " fixes weird underline problem in the groovy syntax
  au filetype java setlocal ts=4 sw=4 et
  au filetype java syn clear javaUserLabel " also fixes weird underline problem in the java syntax
  au filetype json syntax match Comment +\/\/.\+$+
  au filetype make set noexpandtab sw=4 sts=4
  au filetype objc setlocal ts=4 sts=4 sw=4 et
  au filetype objcpp setlocal ts=4 sts=4 sw=4 et
  au filetype python setlocal ts=4 sts=4 sw=4 et
  au filetype swift setlocal ts=4 sts=4 sw=4 et
  au filetype tags setlocal nowrap
  au filetype tags setlocal ts=32
  au filetype xml setlocal ts=4 sts=4 sw=4 et
  au filetype yaml syn clear yamlBlockCollectionItemStart " fixes weird underline problem in the yaml syntax
]]

-- Change cursor shape between insert and normal mode
vim.cmd [[
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
]]
