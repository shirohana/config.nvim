local telescope = require 'telescope'

telescope.setup {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
  },
}
