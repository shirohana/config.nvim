local fn = vim.fn
local keymap = vim.keymap.set

if fn['dein#tap']('neo-tree.nvim') then
  -- Toggle NeoTree, using <Opt-;>
  keymap('n', '…', '<Cmd>Neotree toggle<CR>')
  -- Find current file in NeoTree, using <Opt-Shift-;>
  keymap('n', 'Ú', '<Cmd>Neotree reveal<CR>')
end

if fn['dein#tap']('telescope.nvim') then
  keymap('n', '<C-P>', '<Cmd>Telescope find_files<CR>')
  keymap('n', '<C-O>', '<Cmd>Telescope buffers<CR>')
end

if fn['dein#tap']('undotree') then
  keymap('n', 'U', '<Cmd>UndotreeToggle<Bar>wincmd p<CR>')
end
