-- TreeSitterContext https://github.com/nvim-treesitter/nvim-treesitter-context
local TreeSitterContext = 'nvim-treesitter/nvim-treesitter-context'

-- TreeSitterRainbow https://github.com/p00f/nvim-ts-rainbow
local TreeSitterRainbow = 'p00f/nvim-ts-rainbow'

-- TreeSitterTextobjects https://github.com/nvim-treesitter/nvim-treesitter-textobjects
local TreeSitterTextobjects = 'nvim-treesitter/nvim-treesitter-textobjects'

-- TreesitterIndentObject https://github.com/kiyoon/treesitter-indent-object.nvim
local TreesitterIndentObject = 'kiyoon/treesitter-indent-object.nvim'

-- TreeSitter https://github.com/nvim-treesitter/nvim-treesitter
local TreeSitter = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    TreeSitterContext,
    TreeSitterRainbow,
    TreeSitterTextobjects,
    TreesitterIndentObject,
  },
  opts = {
    ensure_installed = {
      -- 'help',
      'json',
      'lua',
      'markdown',
      'python',
      'query',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'yaml',
    },
    autotag = {
      enable = true,
    },
    highlight = {
      enable = true,
      disable = {
        'help',
        'plantuml',
        'stylus',
      },
    },
    indent = {
      enable = true,
      disable = {},
    },
    playground = {
      enable = true,
    },
    rainbow = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['ab'] = '@block.outer',
          ['ib'] = '@block.inner',
          ['a0'] = '@conditional.outer',
          ['i0'] = '@conditional.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
        },
        selection_modes = {
          ['@block.outer'] = 'V',
          ['@conditional.outer'] = 'V',
          ['@function.outer'] = 'V',
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_previous_start = {
          ['[['] = '@block.outer',
          ['[c'] = '@class.outer',
          ['[]'] = '@function.outer',
          ['[f'] = '@function.outer',
        },
        goto_next_start = {
          [']]'] = '@block.outer',
          [']c'] = '@class.outer',
          [']f'] = '@function.outer',
          [']['] = '@function.outer',
        },
      },
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}

return {
  TreeSitter,
}
