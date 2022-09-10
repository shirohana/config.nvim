local fn = vim.fn
local keymap = vim.keymap.set

if fn['dein#tap']('neo-tree.nvim') then
  -- Toggle NeoTree, using <Opt-;>
  keymap('n', '…', '<Cmd>Neotree toggle<CR>')
  -- " Find current file in NERDTree, using `Opt-Shift-;`
  -- nmap Ú :<C-u>NERDTreeFind<CR>
end
