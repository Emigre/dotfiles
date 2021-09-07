vim.opt.autoread = true
vim.opt.backspace = 'indent,eol,start' -- allow backspace in insert mode
vim.opt.clipboard = 'unnamed' -- use the OS clipboard by default (on versions compiled with `+clipboard`)
vim.opt.errorbells = false
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
vim.opt.shortmess = 'atI' -- don't show intro message
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeout = true -- time out on mappings and others
vim.opt.timeoutlen = 2000 -- milliseconds before timing out
vim.opt.ttyfast = true -- optimize for fast terminal connections
vim.opt.undodir = '~/.local/share/nvim/undo'
vim.opt.undofile = true
vim.opt.visualbell = false
vim.opt.wildmenu = true -- enhance command-line completion

vim.g.mapleader = ' '
