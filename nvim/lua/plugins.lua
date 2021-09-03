vim.o.compatible = false
vim.bo.modeline = false
vim.o.filetype = 'off'

vim.fn["plug#begin"]('~/.config/nvim/plugged')

-- Simplified clipboard
vim.fn["plug#"]('svermeulen/vim-easyclip')
vim.fn["plug#"]('tpope/vim-repeat')

-- CtrlP
vim.fn["plug#"]('ctrlpvim/ctrlp.vim')

-- NERDTree
vim.fn["plug#"]('scrooloose/nerdtree')

-- Buffer tabs
vim.fn["plug#"]('ap/vim-buftabline')
vim.fn["plug#"]('jlanzarotta/bufexplorer')

-- Indentation lines
vim.fn["plug#"]('Yggdroot/indentLine')

-- Git integration
vim.fn["plug#"]('airblade/vim-gitgutter')
vim.fn["plug#"]('tpope/vim-fugitive')
vim.fn["plug#"]('tommcdo/vim-fugitive-blame-ext')

-- Editorconfig integration
vim.fn["plug#"]('editorconfig/editorconfig-vim')

-- Improved code commenting
vim.fn["plug#"]('preservim/nerdcommenter')

-- LSP (code analysis and code completion)
vim.fn["plug#"]('neovim/nvim-lspconfig')
vim.fn["plug#"]('nvim-lua/completion-nvim')

-- code formatting
vim.fn["plug#"]('sbdchd/neoformat')

-- JavaScript
vim.fn["plug#"]('pangloss/vim-javascript', { ['for'] = {'javascript', 'javascript.jsx'} })
vim.fn["plug#"]('mxw/vim-jsx', { ['for'] = {'javascript', 'javascript.jsx'} })
vim.fn["plug#"]('jparise/vim-graphql')

-- TypeScript
vim.fn["plug#"]('leafgarland/typescript-vim', { ['for'] = {'typescript', 'typescript.jsx'} })
vim.fn["plug#"]('ianks/vim-tsx', { ['for'] = {'typescript', 'typescript.jsx'} })

-- C and C++
vim.fn["plug#"]('bfrg/vim-cpp-modern', { ['for'] = {'c', 'cpp'} })
-- vim.fn["plug#"]('drmikehenry/vim-headerguard', { ['for'] = {'c', 'cpp'} })
-- vim.fn["plug#"]('rhysd/vim-clang-format', { ['for'] = {'c', 'cpp', 'h', 'hpp'} })

-- Python
vim.fn["plug#"]('Vimjas/vim-python-pep8-indent', { ['for'] = 'python' })

-- Haskell
vim.fn["plug#"]('neovimhaskell/haskell-vim', { ['for'] = 'haskell' })

-- Other languages
vim.fn["plug#"]('elzr/vim-json', { ['for'] = 'json' })
vim.fn["plug#"]('plasticboy/vim-markdown')
vim.fn["plug#"]('keith/swift.vim', { ['for'] = 'swift' })

-- Nerd Fonts support
vim.fn["plug#"]('ryanoasis/vim-devicons')
vim.fn["plug#"]('tiagofumo/vim-nerdtree-syntax-highlight')

vim.fn["plug#end"]()
