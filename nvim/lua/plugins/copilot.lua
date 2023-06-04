local Plugins = require('vars').Plugins

---@type LazyPluginSpec
local Copilot = {
  Plugins.Copilot,
  init = function()
    vim.g.copilot_filetypes = {
      markdown = true,
      ['neo-tree'] = false,
    }
  end,
}

return { Copilot }
