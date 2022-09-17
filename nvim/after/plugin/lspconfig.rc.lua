local lspconfig = require 'lspconfig'
local cmp_lsp = require 'cmp_nvim_lsp'

local lsp = vim.lsp
local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- keymap
end

local capabilities =
  cmp_lsp.update_capabilities(lsp.protocol.make_client_capabilities())

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostic = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lsp.set_log_level 'warn'

lsp.handlers['textDocument/publishDiagnostics'] =
  lsp.with(lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = '',
    },
  })

lsp.protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}
