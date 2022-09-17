local nls = require 'null-ls'
local formatter = nls.builtins.formatting

nls.setup {
  sources = {
    formatter.stylua,
  },
}
