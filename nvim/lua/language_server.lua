local nvim_lsp = require('lspconfig')

vim.cmd('hi! LspDiagnosticsDefaultError guifg=#767676')
vim.cmd('hi! LspDiagnosticsSignError guifg=#767676')

vim.cmd('hi! LspDiagnosticsWarning guifg=#767676')
vim.cmd('hi! LspDiagnosticsSignWarning guifg=#767676')

vim.cmd('hi! LspDiagnosticsInformation guifg=#767676')
vim.cmd('hi! LspDiagnosticsSignInformation guifg=#767676')

vim.cmd('hi! LspDiagnosticsHint guifg=#767676')
vim.cmd('hi! LspDiagnosticsSignHint guifg=#767676')

vim.cmd('sign define LspDiagnosticsSignError text=░ texthl=SpellBad linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignWarning text=░ texthl=SpellRare linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignInformation text=░ texthl=SpellRare linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignHint text=░ texthl=SpellRare linehl= numhl=')

-- uncomment to enable logging
-- vim.lsp.set_log_level("debug")
-- open logs with :lua vim.cmd('e'..vim.lsp.get_log_path())

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require'completion'.on_attach()
end

-- clangd
require'lspconfig'.clangd.setup{
  cmd = { "clangd", "--background-index"  },
  on_attach=on_attach,
}

-- ghcide
require'lspconfig'.ghcide.setup{
  on_attach=on_attach,
}

-- python
require'lspconfig'.pylsp.setup{
  on_attach=on_attach,
}

-- tsserver
require'lspconfig'.tsserver.setup{
  cmd = { "typescript-language-server", "--stdio", "--tsserver-path", "node_modules/.bin/tsserver" },
  on_attach=on_attach,
}
-- debug command options:
-- '--tsserver-log-file', vim.fn.expand('~/.cache/nvim/tsserver.log'), '--log-level', '4'

-- flow
require'lspconfig'.flow.setup{
  on_attach=on_attach,
}

-- diagnostics
require'lspconfig'.diagnosticls.setup{
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

