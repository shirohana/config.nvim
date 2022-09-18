local exists, telescope = pcall(require, 'telescope')
if not exists then
  return
end

telescope.load_extension 'fzf'

telescope.setup {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
}
