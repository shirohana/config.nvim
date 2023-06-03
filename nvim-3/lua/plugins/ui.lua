-- Theme https://github.com/overcache/NeoSolarized
-- Due to we need some customization, we cloned the scheme into
-- `colors/NeoSolarized.vim`.

local colors = require('themes.solarized_dark').colors

-- Airline https://github.com/vim-airline/vim-airline
local Airline = {
  'vim-airline/vim-airline',
  dependencies = {
    'vim-airline/vim-airline-themes',
  },
  init = function()
    local g = vim.g
    -- Theme
    g.airline_theme = 'solarized'
    g.airline_solarized_bg = 'dark'

    -- Use unicode characters
    g.airline_powerline_fonts = 1

    -- airline # extensions # airline
    g['airline#extensions#tabline#enabled'] = 1

    g['airline#extensions#tabline#show_buffers'] = 1
    g['airline#extensions#tabline#show_close_button'] = 0
    g['airline#extensions#tabline#show_tabs'] = 1

    g['airline#extensions#tabline#switch_buffers_and_tabs'] = 0

    g['airline#extensions#tabline#tab_nr_type'] = 0

    -- Buffer name formmatter
    g['airline#extensions#tabline#formatter'] = 'unique_tail_improved'
    g['airline#extensions#tabline#fnamemod'] = ':t'
    g['airline#extensions#tabline#fnamecollapse'] = 0
    g['airline#extensions#tabline#fnametruncate'] = 12

    -- airline # extensions # ctrlspace
    g['airline#extensions#ctrlspace#enabled'] = 1
  end,
}

-- Colorizer https://github.com/NvChad/nvim-colorizer.lua
local Colorizer = {
  'NvChad/nvim-colorizer.lua',
  config = true,
}

-- Cursorword https://github.com/itchyny/vim-cursorword
local Cursorword = 'itchyny/vim-cursorword'

-- IndentBlankline https://github.com/lukas-reineke/indent-blankline.nvim
local IndentBlankline = {
  'lukas-reineke/indent-blankline.nvim',
  opts = {
    space_char_blankline = ' ',
    show_current_context = true,
    show_current_context_start = true,
    char = '',
    char_highlight_list = {
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
    },
    space_char_highlight_list = {
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
    },
    show_trailing_blankline_indent = false,
  },
  init = function()
    vim.cmd [[
      highlight IndentBlanklineIndent1 guibg=#002b36 gui=nocombine
      highlight IndentBlanklineIndent2 guibg=#073642 gui=nocombine
    ]]
  end,
}

-- Lualine https://github.com/nvim-lualine/lualine.nvim
local Lualine = {
  'nvim-lualine/lualine.nvim',
  config = true,
  enabled = false,
}

-- Hlslens https://github.com/kevinhwang91/nvim-hlslens
local Hlslens = {
  'kevinhwang91/nvim-hlslens',
  opts = {
    calm_down = true,
    override_lens = function(render, pos_list, nearest, index, rel_index)
      local offset = math.abs(rel_index) < 2 and '' or math.abs(rel_index)
      local direction = rel_index < 0 and 'N' or (rel_index < 1 and '' or 'n')
      -- local text = ('[%s%s %d/%d]'):format(offset, direction, index, #pos_list)
      -- local text = (' %s%s '):format(offset, direction)
      local text = offset .. direction
      text = text == '' and '' or ' ' .. text .. ' '
      local chunks
      if nearest then
        chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLensNear' } }
      else
        chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLens' } }
      end
      local row, col = unpack(pos_list[index])
      render.setVirt(0, row - 1, col - 1, chunks, nearest)
    end,
  },
  init = function()
    vim.cmd [[
        highlight link HlSearchLens LineNr
      ]]
  end,
}

-- Scrollbar https://github.com/petertriho/nvim-scrollbar
local Scrollbar = {
  'petertriho/nvim-scrollbar',
  dependencies = {
    Hlslens,
  },
  opts = {
    handle = {
      text = ' ',
      color = '#0b4f60',
    },
    marks = {
      Cursor = {
        text = '□',
        priority = 5,
        color = colors.cyan,
      },
      Search = {
        text = { '◇', '◆' },
        priority = 1,
        color = colors.blue,
      },
      Error = {
        -- text = { '▱', '▰' },
        text = { '□', '■' },
        priority = 2,
        color = colors.red,
      },
      Warn = {
        text = { '□', '■' },
        priority = 3,
        color = colors.yellow,
      },
      Info = {
        text = { '-', '=' },
        priority = 4,
        color = nil,
      },
      Hint = {
        text = { '-', '=' },
        priority = 5,
        color = nil,
      },
      Misc = {
        text = { '-', '=' },
        priority = 6,
        color = nil,
      },
      GitAdd = {
        text = '▏',
        priority = 7,
        color = colors.green,
      },
      GitChange = {
        text = '▏',
        priority = 7,
        color = colors.yellow,
      },
      GitDelete = {
        text = '▏',
        priority = 7,
        color = colors.red,
      },
    },
    excluded_buftypes = {
      'nofile',
      'terminal',
    },
    excluded_filetypes = {
      'LspsagaHover',
      'noice',
      'prompt',
    },
    autocmd = {
      render = {
        'BufWinEnter',
        'TabEnter',
        'TermEnter',
        'WinEnter',
        'CmdwinLeave',
        'TextChanged',
        'VimResized',
        'WinScrolled',
      },
      clear = {
        'BufWinLeave',
        'TabLeave',
        'TermLeave',
        'WinLeave',
      },
    },
    handlers = {
      cursor = true,
      diagnostic = true,
      gitsigns = true,
      handle = true,
      search = true,
    },
  },
}

return {
  Airline,
  Colorizer,
  Cursorword,
  IndentBlankline,
  Lualine,
  Scrollbar,
}
