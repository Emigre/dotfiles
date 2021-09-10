local map = vim.api.nvim_set_keymap

-- function to check if NERDTree is open or active
vim.cmd [[
  fun! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
  endf
]]

-- close vim if the only window left open is a NERDTree
vim.cmd [[
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | bwipeout! | q | endif
]]

-- disable some keys inside NERDTree
vim.cmd [[
  au FileType nerdtree noremap <silent> <buffer> h <Nop>
  au FileType nerdtree noremap <silent> <buffer> i <Nop>
  au FileType nerdtree noremap <silent> <buffer> s <Nop>
  au FileType nerdtree noremap <silent> <buffer> t <Nop>
  au FileType nerdtree noremap <silent> <buffer> u <Nop>
]]

-- close with C-x when inside the tree
vim.cmd [[
  au FileType nerdtree noremap <silent> <buffer> q :call NERDTree__toggleTree()<CR>
]]

-- use o to 'open' in the tree in addition to the usual keymap
vim.cmd [[
  au FileType nerdtree map <silent> <buffer> o <CR>
]]

-- make j and k do just the standard 'up' and 'down'
vim.cmd [[
  au FileType nerdtree noremap <silent> <buffer> k <Up>
  au FileType nerdtree noremap <silent> <buffer> j <Down>
]]

-- enter and exit tree
map('n', '<leader>e', ':silent! call NERDTree__enterAndExitTree()<CR>', { noremap = true, silent = true })
vim.cmd [[
  au FileType nerdtree noremap <silent> <buffer> <leader>e <C-w>h
]]

vim.cmd [[
  fun! NERDTree__enterAndExitTree()
    if IsNERDTreeOpen()
      exe "keepalt keepjumps normal \<c-w>l"
    else
      NERDTreeToggle
      keepalt keepjumps wincmd p
    endif
  endf
]]

-- toggle tree
map('n', '<leader>E', ':silent! call NERDTree__toggleTree()<CR>', { noremap = true, silent = true })

vim.cmd [[
  fun! NERDTree__toggleTree()
    if IsNERDTreeOpen()
      NERDTreeToggle
    endif
  endf
]]

-- locate current file in tree
map('n', '<leader>d', ':silent! call NERDTree__syncTree()<CR>', { noremap = true, silent = true })

vim.cmd [[
  fun! NERDTree__syncTree()
    let l:startedOutsideTree = &filetype !=# 'nerdtree'
    NERDTreeFind
    let l:isNowInsideTree = &filetype ==# 'nerdtree'
    if l:startedOutsideTree && l:isNowInsideTree
      keepalt keepjumps wincmd p
    endif
  endf
]]

vim.g.NERDTreeCreatePrefix='keepalt keepjumps'
vim.g.NERDTreeDirArrowCollapsible="▾"
vim.g.NERDTreeDirArrowExpandable="▸"
vim.g.NERDTreeDisableExactMatchHighlight = 1
vim.g.NERDTreeExactMatchHighlightColor = {
  LICENSE = '26a077',
  ['.gitignore'] = '26a077',
}
vim.g.NERDTreeExactMatchHighlightFullName = 1
vim.g.NERDTreeExtensionHighlightColor = {
  conf = '26a077',
  css = '26a077',
  ini = '26a077',
  lua = '268ca0',
  yaml = '26a077',
  yml = '26a077',
}
vim.g.NERDTreeFileExtensionHighlightFullName = 1
vim.g.NERDTreeIgnore = {
  '\\.pyc$',
  '\\.pyo$',
  '^CMakeFiles$',
  '^\\.DS_Store$',
  '^\\.cabal-sandbox',
  '^\\.classpath$',
  '^\\.git$',
  '^\\.gradle$',
  '^\\.idea$',
  '^\\.mvn$',
  '^\\.project$',
  '^\\.sass-cache$',
  '^\\.settings$',
  '^\\.stack-work',
  '^\\.tmp$',
  '^__pycache__$',
  '^allure-results$',
  '^bin$',
  '^bower_components$',
  '^build$',
  '^coverage$',
  '^dist$',
  '^gradle$',
  '^node_modules$',
  '^obj$',
  '^tags$',
  '^venv$',
  '^workbench\\.xmi$',
  '^yesod-devel',
}
vim.g.NERDTreeMapActivateNode = 'l' -- assign l to 'open' file or folder
vim.g.NERDTreeMapHelp = '§' -- so ? is available for searches
vim.g.NERDTreeMapOpenExpl = ''
vim.g.NERDTreeMapToggleFilters = '.' -- use . to show filtered files
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeMouseMode = 3 -- 1: double click, 2: double-click on folders, 3: single click
vim.g.NERDTreePatternMatchHighlightFullName = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinPos = 'right'
vim.g.NERDTreeWinSize = 64

vim.cmd [[
  autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeHideCWD #^[</].*$# conceal | setlocal concealcursor=n
]]

vim.cmd [[
  hi NERDTreeDir guifg=#00af00
  hi NERDTreeFile guifg=#009900
  hi NERDTreeExecFile guifg=#00285f
  hi NERDTreeOpenable guifg=#3a3a3a
  hi NERDTreeClosable guifg=#3a3a3a
  hi! CursorLine guifg=#000000 guibg=#5f875f
  hi! link NERDTreeDirSlash NERDTreeDir
  hi! link NERDTreeFlags NERDTreeDir
]]
