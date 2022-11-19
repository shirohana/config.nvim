local exists, ib = pcall(require, 'indent_blankline')
if not exists then
  return
end

-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#073642 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#002b36 gui=nocombine]]

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#002b36 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#073642 gui=nocombine]]

ib.setup {
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
}
