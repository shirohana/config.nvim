local nls = require 'null-ls'
local formatter = nls.builtins.formatting
local action = nls.builtins.code_actions
local diag = nls.builtins.diagnostics

nls.setup {
  sources = {
    action.eslint_d,
    diag.eslint_d.with { diagnostics_format = '[eslint] #{m}\n(#{c})' },
    formatter.prettierd.with {
      filetypes = { 'typescript', 'typescriptreact' },
    },
    formatter.stylua,
  },
}
