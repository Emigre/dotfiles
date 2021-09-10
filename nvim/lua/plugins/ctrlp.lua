vim.cmd [[
  if exists("g:ctrl_user_command")
      unlet g:ctrlp_user_command
  endif
]]

-- color to highlight matching segments of the path
vim.cmd [[
  hi CtrlPMatch guifg=#afd787
]]

-- main statusline
vim.cmd [[
  fun! CtrlPStatusLine(...)
    let regex = a:3 ? '%#LineNr# regex %*' : ''
    let item = ' %#Character# ' . a:5 . ' %*'
    let dir = ' %=%<%#LineNr# ' . getcwd() . ' %*'
    retu regex.item.dir
  endf
]]

vim.cmd [[
  command CtrlPRefresh CtrlPClearCache
]]

vim.g.ctrlp_by_filename = 1
vim.g.ctrlp_custom_ignore = { -- TODO convert patterns to lua
  dir = '',
  file = '',
}
vim.g.ctrlp_mruf_exclude = '/private/*'
vim.g.ctrlp_root_markers = { '.ctrlp' }
vim.g.ctrlp_show_hidden = 1
vim.g.ctrlp_status_func = { main = 'CtrlPStatusLine' }
vim.g.ctrlp_working_path_mode = 'ra'

-- let g:ctrlp_custom_ignore = {
--    'dir':  '\v[\/](' . join([
--     '\.cabal-sandbox',
--     '\.cache',
--     '\.detox-artifacts',
--     '\.git',
--     '\.stack-work',
--     '\.svn',
--     '\.temp',
--     '\.xcodeproj',
--     'allure-results',
--     'artifacts',
--     'assets',
--     'bin',
--     'build',
--     'cmake-build-debug',
--     'CMakeFiles',
--     'coverage',
--     'dist',
--     'docs',
--     'gradle',
--     'node_modules',
--     'obj',
--     'plugged',
--     'swaps',
--     'site-packages',
--     'target',
--     'undo',
--     'venv',
--     'yesod-devel',
--   ], '|') . ')$',
--   'file': '\v(' . join([
--     'compile_commands.json',
--     '\.d',
--     '\.DS_Store',
--     '\.o',
--     '\.out',
--     '\.plist',
--     '\.pyc',
--     '\.pyo',
--     '\.rar',
--     '\.xcconfig',
--     '\.zip',
--     'tags\.lock',
--     'tags\.temp',
--   ], '|') . ')$',
-- }
