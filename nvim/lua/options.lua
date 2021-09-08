vim.opt.autoread = true
vim.opt.backspace = 'indent,eol,start' -- allow backspace in insert mode
vim.opt.clipboard = 'unnamed' -- use the OS clipboard by default (on versions compiled with `+clipboard`)
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.errorbells = false
vim.opt.expandtab = true -- use spaces for tabs in insert mode
vim.opt.foldenable = false
vim.opt.hlsearch = false -- do not highlight searches by default
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.incsearch = true
vim.opt.list = true -- list mode: shows tabs
vim.opt.listchars = 'nbsp:␣,tab:᠁ ' -- characters for tabs and nbsp
vim.opt.mouse = 'a'
-- paste mode: reflowing comment blocks with gq needs nopaste
-- http://stackoverflow.com/questions/8435808/reflowing-comment-blocks-with-vim
-- http://blog.ayaz.pk/2008/06/21/paste-mode-pasting-text-and-indenting-it-in-vim/
vim.opt.paste = false
vim.opt.ruler = true
vim.opt.rulerformat = '%l,%c%=%P'
vim.opt.shiftwidth = 2
vim.opt.shortmess = 'atIc'
vim.opt.signcolumn = 'yes'
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeout = true -- time out on mappings and others
vim.opt.timeoutlen = 2000 -- milliseconds before timing out
vim.opt.ttyfast = true -- optimize for fast terminal connections
vim.opt.undodir = os.getenv('HOME')..'/.local/share/nvim/undo'
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.visualbell = false
vim.opt.wildmenu = true -- enhance command-line completion

vim.g.mapleader = ' '

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
