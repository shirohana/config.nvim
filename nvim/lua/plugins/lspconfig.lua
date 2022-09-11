local lspconfig = require 'lspconfig'

lspconfig.sumneko_lua.setup {
  Lua = {
    completion = {
      callSnippet = 'Replace'
    }
  }
}

vim.lsp.set_log_level('warn')

-- icon
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = '',
    },
  }
)
