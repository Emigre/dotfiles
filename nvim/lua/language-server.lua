local nvim_lsp = require('lspconfig')
local map = vim.api.nvim_set_keymap

vim.g.completion_enable_fuzzy_match = 1
vim.g.completion_matching_ignore_case = 1
vim.g.completion_matching_strategy_list = { 'fuzzy', 'exact', 'substring' }
vim.g.completion_trigger_keyword_length = 2

-- improved completion
vim.cmd [[
  fun! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endf
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : CheckBackSpace() ? "\<Tab>" : completion#trigger_completion()
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]]

-- diagnostics
map('n', '<C-j>', 'call LSPNextDiagnosticCycle()<CR>', {})
map('n', '<C-k>', 'call LSPPrevDiagnosticCycle()<CR>', {})

vim.cmd [[
  fun! LSPNextDiagnosticCycle()
    lua vim.lsp.diagnostic.goto_next()
  endfun

  fun! LSPPrevDiagnosticCycle()
    lua vim.lsp.diagnostic.goto_prev()
  endfun
]]

map('n', '<leader>D', 'call LSPOpenDiagnostics()<CR>', { silent = true })
vim.cmd [[
  au BufReadPost quickfix nnoremap <silent> <buffer> <leader>D <C-w>c
]]

vim.cmd [[
  fun! LSPOpenDiagnostics()
    lua vim.lsp.diagnostic.set_loclist()
  endfun
]]


-- go to definition
map('n', '<leader>;', 'call LSPGoToDefinition()<CR>', { silent = true })

vim.cmd [[
  fun! LSPGoToDefinition()
    call Main__closeFloatingWindow()
    lua vim.lsp.buf.definition()
  endfun
]]

-- show references
map('n', 'R', 'call LSPShowReferences()<CR>', { silent = true, noremap = true })

vim.cmd [[
  fun! LSPShowReferences()
    call Main__closeFloatingWindow()
    lua vim.lsp.buf.references()
  endfun
]]

-- show type definition
map('n', 't', 'call LSPShowTypeDefinition()<CR>', { silent = true, noremap = true })

vim.cmd [[
  fun! LSPShowTypeDefinition()
    lua vim.lsp.buf.hover()
  endfun
]]

-- language servers configuration

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require'completion'.on_attach()
end

nvim_lsp.clangd.setup{ cmd = { "clangd", "--background-index"  }, on_attach=on_attach }

nvim_lsp.ghcide.setup{ on_attach=on_attach }

nvim_lsp.pylsp.setup{ on_attach=on_attach }

-- debug command options: '--tsserver-log-file', vim.fn.expand('~/.cache/nvim/tsserver.log'), '--log-level', '4'
nvim_lsp.tsserver.setup{
  cmd = { "typescript-language-server", "--stdio", "--tsserver-path", "node_modules/.bin/tsserver" },
  on_attach=on_attach,
}

nvim_lsp.flow.setup{ on_attach=on_attach }

nvim_lsp.diagnosticls.setup{
  cmd = { "diagnostic-languageserver", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  on_attach=on_attach,
  init_options = {
    linters = {
      eslint = {
        command = "/usr/local/bin/eslint",
        rootPatterns = { ".git" },
        debounce = 100,
        args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [eslint] [${ruleId}]",
          security = "severity"
        },
        securities = { ["2"] = "error", ["1"] = "warning" }
      }
    },
    filetypes = {
      typescript = "eslint",
      typescriptreact = "eslint",
      ["typescript.tsx"] = "eslint",
      typescript = "eslint",
      javascript = "eslint",
      javascriptreact = "eslint",
      ["javascript.jsx"] = "eslint"
    }
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)

-- uncomment to enable logging
-- vim.lsp.set_log_level("debug")
-- open logs with :lua vim.cmd('e'..vim.lsp.get_log_path())

vim.cmd [[
  hi! LspDiagnosticsDefaultError guifg=#767676
  hi! LspDiagnosticsSignError guifg=#767676
  hi! LspDiagnosticsWarning guifg=#767676
  hi! LspDiagnosticsSignWarning guifg=#767676
  hi! LspDiagnosticsInformation guifg=#767676
  hi! LspDiagnosticsSignInformation guifg=#767676
  hi! LspDiagnosticsHint guifg=#767676
  hi! LspDiagnosticsSignHint guifg=#767676

  hi! DiagnosticErrorSymbol guisp=#bc6c4c guifg=#dc8c6c
  hi! DiagnosticWarningSymbol guisp=#bc6c9c guifg=#bc8cbc
  sign define LspDiagnosticsSignError text=░ texthl=DiagnosticErrorSymbol linehl= numhl=
  sign define LspDiagnosticsSignWarning text=░ texthl=DiagnosticWarningSymbol linehl= numhl=
  sign define LspDiagnosticsSignInformation text=░ texthl=DiagnosticWarningSymbol linehl= numhl=
  sign define LspDiagnosticsSignHint text=░ texthl=DiagnosticWarningSymbol linehl= numhl=
]]
