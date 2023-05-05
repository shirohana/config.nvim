local lspconfig = require 'lspconfig'
local dcolor = require 'document-color'
local navic = require 'nvim-navic'

local api = vim.api
local lsp = vim.lsp
local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
  if client.server_capabilities.colorProvider then
    dcolor.buf_attach(bufnr)
    -- dcolor.buf_toggle()
  end

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
    vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  end

  -- when filetype is TypeScript, attach twoslash queries
  if client.name == 'tsserver' then
    require('twoslash-queries').attach(client, bufnr)
  end

  local function bkeymap(mode, lhs, rhs)
    keymap(mode, lhs, rhs, { buffer = bufnr })
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- bkeymap('n', 'd<Space>', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  -- bkeymap('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
  bkeymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  bkeymap('n', 'gu', '<Cmd>lua vim.lsp.buf.references()<CR>')
  bkeymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  bkeymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
  -- bkeymap('n', 'zj', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  -- bkeymap('n', 'zk', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  bkeymap('n', 'z<Space>', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
  -- bkeymap('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  -- bkeymap('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  -- bkeymap('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  -- bkeymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>')
  -- bkeymap('n', '®', '<Cmd>lua vim.lsp.buf.rename()<CR>')
  -- bkeymap('n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
  -- bkeymap('n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  -- bkeymap('n', '<space>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.colorProvider = {
  dynamicRegistration = true,
}

lspconfig.prismals.setup {}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = {
    'javascript',
    'typescript',
    'typescript.tsx',
    'typescriptreact',
  },
  cmd = { 'typescript-language-server', '--stdio' },
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

-- lsp.protocol.CompletionItemKind = {
--   '', -- Text
--   '', -- Method
--   '', -- Function
--   '', -- Constructor
--   '', -- Field
--   '', -- Variable
--   '', -- Class
--   'ﰮ', -- Interface
--   '', -- Module
--   '', -- Property
--   '', -- Unit
--   '', -- Value
--   '', -- Enum
--   '', -- Keyword
--   '﬌', -- Snippet
--   '', -- Color
--   '', -- File
--   '', -- Reference
--   '', -- Folder
--   '', -- EnumMember
--   '', -- Constant
--   '', -- Struct
--   '', -- Event
--   'ﬦ', -- Operator
--   '', -- TypeParameter
-- }
