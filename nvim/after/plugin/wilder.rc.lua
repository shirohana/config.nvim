local exists, wilder = pcall(require, 'wilder')
if not exists then
  return
end

wilder.setup {
  modes = { ':', '/', '?' },
  next_key = '<C-n>',
  previous_key = '<C-p>',
}

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

-- wilder.set_option(
--   'renderer',
--   wilder.popupmenu_renderer(
--     wilder.popupmenu_border_theme {
--       highlighter = wilder.basic_highlighter(),
--       left = { ' ', wilder.popupmenu_devicons() },
--       right = { ' ', wilder.popupmenu_scrollbar() },
--       highlights = {
--         border = 'Normal', -- highlight to use for the border
--       },
--       border = 'rounded',
--     },
--   )
-- )

-- wilder.set_option('renderer', wilder.popupmenu_renderer({
--   pumblend = 20,
-- }))
