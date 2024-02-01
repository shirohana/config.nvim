local Plugins = require('vars').Plugins

-- NullLs https://github.com/jose-elias-alvarez/null-ls.nvim
---@type LazyPlugin
local NullLs = {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = { Plugins.Plenary },
  config = function()
    local nls = require 'null-ls'
    local formatter = nls.builtins.formatting
    local action = nls.builtins.code_actions
    local diag = nls.builtins.diagnostics
    nls.setup {
      sources = {
        action.eslint_d,
        diag.eslint_d.with { diagnostics_format = '[eslint] #{m}\n(#{c})' },
        formatter.blackd,
        formatter.prettierd.with {
          filetypes = { 'javascript', 'typescript', 'typescriptreact' },
        },
        formatter.stylua,
      },
    }
  end,
}

return { NullLs }
