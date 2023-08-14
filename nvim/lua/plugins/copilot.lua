local Plugins = require('vars').Plugins

---@type LazyPluginSpec
local Copilot = {
  Plugins.Copilot,
  init = function()
    vim.g.copilot_filetypes = {
      gitcommit = true,
      markdown = true,
      yaml = true,
      ['neo-tree'] = false,
      [''] = true,
    }
  end,
}

return { Copilot }
