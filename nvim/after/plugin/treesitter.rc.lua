local configs = require 'nvim-treesitter.configs'
local parsers = require 'nvim-treesitter.parsers'

local parser_config = parsers.get_parser_configs()

parser_config.tsx.filetype_to_parsername = {
  'javascript',
  'typescript.tsx',
}

configs.setup {
  ensure_installed = {
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
}
