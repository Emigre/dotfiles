vim.g.neoformat_try_formatprg = 0
vim.g.neoformat_basic_format_align = 0
vim.g.neoformat_basic_format_trim = 0
vim.g.neoformat_typescript_prettier = {
  exe = './node_modules/.bin/prettier',
  args = { '--write', '--config .prettierrc' },
  replace = 1
}
vim.g.neoformat_enabled_typescript = { 'prettier' }
vim.g.neoformat_enabled_javascript= { 'prettier' }
vim.g.neoformat_enabled_css = { 'prettier' }
vim.g.neoformat_enabled_html = { 'prettier' }
vim.g.neoformat_enabled_haskell = { 'brittany' }
vim.g.neoformat_enabled_python = { 'autopep8' }
vim.g.neoformat_enabled_cpp = { 'clangformat' }
vim.g.neoformat_enabled_c = { 'clangformat' }
vim.g.neoformat_enabled_markdown = {}

-- Ignore error E790: undojoin is not allowed after undo
vim.cmd [[
  au BufWritePre * try | undojoin | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
]]
