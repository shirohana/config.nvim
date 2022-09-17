local configs = require 'nvim-treesitter.configs'
local parsers = require 'nvim-treesitter.parsers'

local parser_config = parsers.get_parser_configs()

parser_config.tsx.filetype_to_parsername = {
  'javascript',
  'typescript.tsx',
}

configs.setup {
  ensure_installed = {
    -- 'html',
    -- 'javascript',
    -- 'json',
    -- 'markdown',
    -- 'python',
    -- 'toml',
    -- 'tsx',
    -- 'typescript',
    -- 'yaml',
  },
  highlight = {
    enable = true,
    disable = {
      'plantuml',
      'stylus',
    },
  },
  indent = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = true,
  },
}