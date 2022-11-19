-- stylua: ignore
-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- Credit: itchyny(lightline)

local colors = require('themes.solarized_dark').colors

return {
  normal = {
    a = { fg = colors.base03, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.base03, bg = colors.base02 },
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
