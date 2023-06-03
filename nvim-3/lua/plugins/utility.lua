-- Wilder https://github.com/gelguy/wilder.nvim
local Wilder = {
  'gelguy/wilder.nvim',
  opts = {
    modes = { ':', '/', '?' },
    next_key = '<C-n>',
    previous_key = '<C-p>',
  },
  config = function(_, opts)
    local wilder = require 'wilder'
    wilder.setup(opts)
    wilder.set_option(
      'renderer',
      wilder.popupmenu_renderer {
        reverse = 1,
        pumblend = 20,
        highlighter = wilder.basic_highlighter(),
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
      }
    )
  end,
}

-- OpenBrowser https://github.com/tyru/open-browser.vim
local OpenBrowser = {
  'tyru/open-browser.vim',
  event = 'VeryLazy',
  init = function()
    vim.g.openbrowser_browser_commands = {
      {
        name = 'open',
        args = { '{browser}', '-a', 'Safari', '{uri}' },
        background = 0,
      },
    }
  end,
}

return {
  OpenBrowser,
  Wilder,
  -- Nui https://github.com/MunifTanjim/nui.nvim
  { 'MunifTanjim/nui.nvim', lazy = true },
  -- Plenary https://github.com/nvim-lua/plenary.nvim
  { 'nvim-lua/plenary.nvim', lazy = true },
  -- WebDevicons https://github.com/nvim-tree/nvim-web-devicons
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  -- Repeat https://github.com/tpope/vim-repeat
  { 'tpope/vim-repeat', event = 'VeryLazy' },
}
