local fn = vim.fn
local keymap = vim.keymap.set

-- Commentary
if fn['dein#tap'] 'vim-commentary' then
  keymap({ 'n', 'o', 'v' }, 'gc', '<Plug>Commentary')
  keymap('n', 'gcc', '<Plug>CommentaryLine')
  keymap('n', 'cgc', '<Plug>ChangeCommentary')
  keymap('n', 'gcu', '<Plug>Commentary<Plug>Commentary')
end

-- CtrlSpace
if fn['dein#tap'] 'vim-ctrlspace' then
  -- Show ctrlspace menu
  keymap('n', '<LocalLeader>c', '<Cmd>CtrlSpace<CR>')
  -- Buffer navigating
  -- nnoremap <silent> <C-o> :<C-u>CtrlSpaceBuffers<CR>
  -- Create new workspace, using <Opt-Shift-w>
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

-- EasyAlign
if fn['dein#tap'] 'vim-easy-align' then
  keymap('n', 'ga', '<Plug>(EasyAlign)')
  keymap('v', 'ga', '<Plug>(LiveEasyAlign)')
end

-- EasyMotion
if fn['dein#tap'] 'vim-easymotion' then
  -- Line navigating
  -- keymap('', '<LocalLeader>j', '<Plug>(easymotion-sol-j)')
  keymap('', '<LocalLeader>J', '<Plug>(easymotion-j)')
  -- keymap('', '<LocalLeader>k', '<Plug>(easymotion-sol-k)')
  keymap('', '<LocalLeader>K', '<Plug>(easymotion-k)')
  keymap('', '<LocalLeader>a', '<Plug>(easymotion-linebackward)')
  keymap('', '<LocalLeader>d', '<Plug>(easymotion-lineforward)')
  -- Word navigating
  -- keymap('', '<LocalLeader>w', '<Plug>(easymotion-w)')
  keymap('', '<LocalLeader>W', '<Plug>(easymotion-W)')
  -- keymap('', '<LocalLeader>b', '<Plug>(easymotion-b)')
  keymap('', '<LocalLeader>B', '<Plug>(easymotion-B)')
  keymap('', '<LocalLeader>e', '<Plug>(easymotion-e)')
  keymap('', '<LocalLeader>E', '<Plug>(easymotion-E)')
  keymap('', '<LocalLeader>ge', '<Plug>(easymotion-ge)')
  keymap('', '<LocalLeader>gE', '<Plug>(easymotion-gE)')
  -- Repeating
  keymap('', '<LocalLeader>n', '<Plug>(easymotion-n)')
  keymap('', '<LocalLeader>N', '<Plug>(easymotion-N)')
  keymap('', '<LocalLeader><Space>', '<Plug>(easymotion-repeat)')
  -- Word searching
  keymap('n', 'ss', '<Plug>(easymotion-sn)')
  keymap('n', 'sf', '<Plug>(easymotion-fl)')
  keymap('n', 'sF', '<Plug>(easymotion-Fl)')
  keymap('n', 'st', '<Plug>(easymotion-tl)')
  keymap('n', 'sT', '<Plug>(easymotion-Tl)')
  -- Word searching (visual mode)
  keymap('v', 'sf', '<Plug>(easymotion-fl)')
  keymap('v', 'sF', '<Plug>(easymotion-Fl)')
  keymap('v', 'st', '<Plug>(easymotion-tl)')
  keymap('v', 'sT', '<Plug>(easymotion-Tl)')
  -- Word searching (operating mode)
  -- if g.force_fix_easymotion_cursor then
  --   keymap('o', 'f', '<Plug>(easymotion-fl-fix)')
  --   keymap('o', 'F', '<Plug>(easymotion-Fl-fix)')
  --   keymap('o', 't', '<Plug>(easymotion-tl-fix)')
  --   keymap('o', 'T', '<Plug>(easymotion-Tl-fix)')
  -- else
  keymap('o', 'f', '<Plug>(easymotion-fl)')
  keymap('o', 'F', '<Plug>(easymotion-Fl)')
  keymap('o', 't', '<Plug>(easymotion-tl)')
  keymap('o', 'T', '<Plug>(easymotion-Tl)')
  -- end
end

-- GitGutter
if fn['dein#tap'] 'vim-gitgutter' then
  -- Hunk navigating
  keymap('n', 'sj', '<Plug>(GitGutterNextHunk)')
  keymap('n', 'sk', '<Plug>(GitGutterPrevHunk)')
  -- Refresh gutter
  keymap('n', '<LocalLeader>sa', '<Cmd>GitGutterAll<CR>')
  -- Stage current hunk
  keymap('n', '<LocalLeader>ss', '<Plug>(GitGutterStageHunk)')
  -- Unstage current file
  keymap(
    'n',
    '<LocalLeader>su',
    "<Cmd>call system('git reset '.expand('%'))<Bar>GitGutterAll<CR>"
  )
  -- Hard reset current hunk
  keymap('n', '<LocalLeader>sr', '<Plug>(GitGutterUndoHunk)')
  -- Toggle hunk preview
  keymap(
    'n',
    '<LocalLeader>s<Space>',
    '<Plug>(helper-gitgutter-toggle-preview)'
  )
end

if fn['dein#tap'] 'hop.nvim' then
  -- Line navigating
  keymap('', '<LocalLeader>j', '<Cmd>HopLineAC<CR>')
  -- keymap('', '<LocalLeader>J', '<Cmd>HopLineStartAC<CR>')
  keymap('', '<LocalLeader>k', '<Cmd>HopLineBC<CR>')
  -- keymap('', '<LocalLeader>K', '<Cmd>HopLineStartBC<CR>')
  -- keymap('', '<LocalLeader>a', '<Cmd>HopWordCurrentLineBC<CR>')
  -- keymap('', '<LocalLeader>d', '<Cmd>HopWordCurrentLineAC<CR>')
  -- " Word navigating
  keymap('', '<LocalLeader>w', '<Cmd>HopWordAC<CR>')
  keymap('', '<LocalLeader>b', '<Cmd>HopWordBC<CR>')
  -- " Word searching
  -- keymap('', 'ss', '<Cmd>HopPattern<CR>')
end

-- LspSaga
if fn['dein#tap'] 'neo-tree.nvim' then
  keymap('n', 'd<Space>', '<Cmd>Lspsaga hover_doc<CR>')
  keymap('n', '<Space>d', '<Cmd>Lspsaga preview_definition<CR>')
  keymap({ 'n', 'i' }, '<C-k>', '<Cmd>Lspsaga signature_help<CR>')
  keymap('n', 'gu', '<Cmd>Lspsaga lsp_finder<CR>')
  keymap('n', 'zi', '<Cmd>Lspsaga code_action<CR>')
  keymap('x', 'zi', '<Cmd>Lspsaga range_code_action<CR>')
  keymap('n', 'zo', '<Cmd>Lspsaga show_line_diagnostics<CR>')
  keymap('n', 'zj', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
  keymap('n', 'zk', '<Cmd>Lspsaga diagnostic_jump_prev<CR>')
  -- Rename symbols, using <Opt-r>
  keymap('n', '®', '<Cmd>Lspsaga rename<CR>')
end

-- NeoTree
if fn['dein#tap'] 'neo-tree.nvim' then
  -- Toggle NeoTree, using <Opt-;>
  keymap('n', '…', '<Cmd>Neotree toggle<CR>')
  -- Find current file in NeoTree, using <Opt-Shift-;>
  keymap('n', 'Ú', '<Cmd>Neotree reveal<CR>')
end

-- Telescope
if fn['dein#tap'] 'telescope.nvim' then
  keymap('n', '<C-P>', '<Cmd>Telescope find_files<CR>')
  keymap('n', '<C-O>', '<Cmd>Telescope buffers<CR>')
end

-- SymbolsOutline
if fn['dein#tap'] 'symbols-outline.nvim' then
  keymap('n', 'K', '<Cmd>SymbolsOutline<CR>')
end

-- Undotree
if fn['dein#tap'] 'undotree' then
  keymap('n', 'U', '<Cmd>UndotreeToggle<Bar>wincmd p<CR>')
end
