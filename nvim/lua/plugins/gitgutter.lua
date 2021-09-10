vim.cmd [[
  hi GitGutterAdd guifg=#00cd00
  hi GitGutterChange guifg=#00cdcd
  hi GitGutterDelete guifg=#ff0000
  hi GitGutterChangeDelete guifg=#ff0000
]]

vim.g.gitgutter_map_keys = 0
vim.g.gitgutter_override_sign_column_highlight = 0
vim.g.gitgutter_sign_added = '│'
vim.g.gitgutter_sign_modified = '│'
vim.g.gitgutter_sign_modified_removed = '│'
vim.g.gitgutter_sign_removed = '│'
vim.g.gitgutter_sign_removed_first_line = '│'
