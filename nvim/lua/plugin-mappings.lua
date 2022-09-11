local fn = vim.fn
local keymap = vim.keymap.set

if fn['dein#tap']('vim-commentary') then
  keymap({'n', 'o', 'v'}, 'gc', '<Plug>Commentary')
  keymap('n', 'gcc', '<Plug>CommentaryLine')
  keymap('n', 'cgc', '<Plug>ChangeCommentary')
  keymap('n', 'gcu', '<Plug>Commentary<Plug>Commentary')
end

if fn['dein#tap']('vim-ctrlspace') then
  -- Show ctrlspace menu
  keymap('n', '<LocalLeader>c', '<Cmd>CtrlSpace<CR>')
  -- Buffer Navigating
  -- nnoremap <silent> <C-o> :<C-u>CtrlSpaceBuffers<CR>
  -- Create New Workspace, using <Opt-Shift-w>
  keymap('n', '„', '<Cmd>CtrlSpaceNewWorkspace<CR>')
  -- Load Workspace, using <Opt-w>
  keymap('n', '∑', '<Cmd>LoadWorkspace<CR>')
  -- Save workspace, using <Opt-s>
  keymap('n', 'ß', '<Cmd>SaveWorkspace<CR>')
  -- Save Workspace with Name, using <Opt-Shift-s>
  keymap('n', 'Í', '<Cmd>SaveWorkspacePrompt<CR>')
  -- Rename tab
  keymap('n', '<LocalLeader>=', '<Cmd>RenameTabLabel<CR>')
end

if fn['dein#tap']('neo-tree.nvim') then
  -- Toggle NeoTree, using <Opt-;>
  keymap('n', '…', '<Cmd>Neotree toggle<CR>')
  -- Find current file in NeoTree, using <Opt-Shift-;>
  keymap('n', 'Ú', '<Cmd>Neotree reveal<CR>')
end

if fn['dein#tap']('telescope.nvim') then
  keymap('n', '<C-P>', '<Cmd>Telescope find_files<CR>')
  keymap('n', '<C-O>', '<Cmd>Telescope buffers<CR>')
  keymap('n', '<C-O>', '<Cmd>Telescope buffers<CR>')
end

if fn['dein#tap']('undotree') then
  keymap('n', 'U', '<Cmd>UndotreeToggle<Bar>wincmd p<CR>')
end
