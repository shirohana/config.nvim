local exists, lualine = pcall(require, 'lualine')
if not exists then
  return
end

local solarized_dark =
  require 'plugins.lualine.themes.customized_solarized_dark'

local function ctrlspace_buffers()
  return [[buffers]]
end

local function ctrlspace_tabs()
  return [[tabs]]
end

lualine.setup {
  options = {
    theme = solarized_dark,
    icons_enabled = true,
    -- globalstatus = true,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },

  sections = {
    lualine_a = {
      { 'mode', padding = 0, separator = { left = ' ', right = '' } },
    },
    lualine_b = { 'diagnostics', 'diff' },
    lualine_c = { 'filename' },
    -- lualine_c = { 'filename', 'branch' },
    -- lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', padding = 0, separator = { right = ' ' } },
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
      function()
        return 'Buffers'
      end,
    },
    lualine_b = {},
    lualine_c = { 'buffers' },
    -- lualine_c = { 'ctrlspace_buffers' },
    lualine_x = {},
    lualine_y = { ctrlspace_tabs },
    lualine_z = {
      function()
        return 'Tabs'
      end,
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

-- require("lualine").setup({
--     sections = {
--         lualine_c = {
--             { { navic.get_location, cond = navic.is_available } },
--         }
--     }
-- })
