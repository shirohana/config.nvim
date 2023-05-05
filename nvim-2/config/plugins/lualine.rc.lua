-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- Credit: itchyny(lightline)
-- 等全部轉移到 lua 之後在做檔案拆分
local colors = {
  base03  =  '#002b36',
  base02  =  '#073642',
  base01  =  '#586e75',
  base00  =  '#657b83',
  base0   =  '#839496',
  base1   =  '#93a1a1',
  base2   =  '#eee8d5',
  base3   =  '#fdf6e3',
  yellow  =  '#b58900',
  orange  =  '#cb4b16',
  red     =  '#dc322f',
  magenta =  '#d33682',
  violet  =  '#6c71c4',
  blue    =  '#268bd2',
  cyan    =  '#2aa198',
  green   =  '#859900',
}
local solarized_dark = {
  normal = {
    a = { fg = colors.base03, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.base03, bg = colors.base03 },
    c = { fg = colors.base1, bg = colors.base02 },
    x = { fg = colors.base1, bg = colors.base02 },
    y = { fg = colors.base03, bg = colors.base1 },
    z = { fg = colors.base03, bg = colors.blue, gui = 'bold' },
  },
  insert = { a = { fg = colors.base03, bg = colors.orange, gui = 'bold' } },
  visual = { a = { fg = colors.base03, bg = colors.magenta, gui = 'bold' } },
  replace = { a = { fg = colors.base03, bg = colors.red, gui = 'bold' } },
  inactive = {
    a = { fg = colors.base0, bg = colors.base02, gui = 'bold' },
    b = { fg = colors.base03, bg = colors.base00 },
    c = { fg = colors.base01, bg = colors.base02 },
  },
}
local solarized_dark_2 = {
  normal = {
    a = { fg = colors.base03, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.base03, bg = colors.base1 },
    c = { fg = colors.base1, bg = colors.base02 },
    x = { fg = colors.base1, bg = colors.base02 },
    y = { fg = colors.base03, bg = colors.base1 },
    z = { fg = colors.base03, bg = colors.blue, gui = 'bold' },
  },
  insert = { a = { fg = colors.base03, bg = colors.orange, gui = 'bold' } },
  visual = { a = { fg = colors.base03, bg = colors.magenta, gui = 'bold' } },
  replace = { a = { fg = colors.base03, bg = colors.red, gui = 'bold' } },
  inactive = {
    a = { fg = colors.base0, bg = colors.base02, gui = 'bold' },
    b = { fg = colors.base03, bg = colors.base00 },
    c = { fg = colors.base01, bg = colors.base02 },
  },
}

local function ctrlspace_buffers()
  return [[buffers]]
end

local function ctrlspace_tabs()
  return [[tabs]]
end

require 'lualine'.setup {
  options = {
    theme = solarized_dark,
    icons_enabled = true,
    -- globalstatus = true,
    component_separators = '',
    section_separators = { left = ' ', right = ' ' },
  },

  sections = {
    lualine_a = {
      { 'mode', padding = 0, separator = { left = ' ', right = '' }},
    },
    lualine_b = { 'diagnostics', 'diff' },
    lualine_c = { 'filename' },
    -- lualine_c = { 'filename', 'branch' },
    -- lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', separator = { right = ' ' } },
    },
  },

  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'progress', 'location' },
  },

  tabline = {
    lualine_a = {
      (function() return 'Buffers'; end),
    },
    lualine_b = {},
    lualine_c = {ctrlspace_buffers},
    lualine_x = {},
    lualine_y = {ctrlspace_tabs},
    lualine_z = {
      (function() return 'Tabs'; end),
    },
  },

  -- winbar = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = {'filename'},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {}
  -- },

  -- inactive_winbar = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = {'filename'},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {}
  -- },

  extensions = {},
}
