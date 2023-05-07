local keymap = vim.keymap.set

local tap = function(name)
  return vim.fn['dein#tap'](name) == 1
end

-- Commentary
if tap 'vim-commentary' then
  keymap({ 'n', 'o', 'v' }, 'gc', '<Plug>Commentary')
  keymap('n', 'gcc', '<Plug>CommentaryLine')
  keymap('n', 'cgc', '<Plug>ChangeCommentary')
  keymap('n', 'gcu', '<Plug>Commentary<Plug>Commentary')
end

-- CtrlSpace
if tap 'vim-ctrlspace' then
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
if tap 'vim-easy-align' then
  keymap('n', 'ga', '<Plug>(EasyAlign)')
  keymap('v', 'ga', '<Plug>(LiveEasyAlign)')
end

-- EasyMotion
if tap 'vim-easymotion' then
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
  -- keymap('o', 'f', '<Plug>(easymotion-fl)')
  -- keymap('o', 'F', '<Plug>(easymotion-Fl)')
  -- keymap('o', 't', '<Plug>(easymotion-tl)')
  -- keymap('o', 'T', '<Plug>(easymotion-Tl)')
  -- end
end

-- Fugitive
if tap 'vim-fugitive' then
  -- Git status, using <Opt-g>
  keymap('n', '©', '<Cmd>Git<CR>')
  keymap('n', 'gb', '<Cmd>Git blame<CR>')
end

-- Fzf
if tap 'fzf.vim' then
  vim.cmd [[
    if mapcheck('<C-o>', 'n') == ''
      nnoremap <silent> <C-O> :<Cmd>Buffers<CR>
    endif
  ]]
  keymap('n', '<C-p>', '<Cmd>Files<CR>')
  -- Search text, using <Opt-f>
  keymap('n', 'ƒ', ':<C-u>Ag<Space>')
end

-- GitGutter
if tap 'vim-gitgutter' then
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

-- Hop
if tap 'hop.nvim' then
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

-- IncsearchFuzzy
if tap 'incsearch-fuzzy.vim' then
  keymap('n', 'z/', '<Plug>(incsearch-fuzzy-/)')
  keymap('n', 'z?', '<Plug>(incsearch-fuzzy-?)')
  keymap('n', 'zg/', '<Plug>(incsearch-fuzzy-stay)')
end

-- LspLines
if tap 'lsp_lines.nvim' then
  local lsp_lines = require 'lsp_lines'
  keymap('n', 'zp', lsp_lines.toggle)
end

-- LspSaga
if tap 'lspsaga.nvim' then
  keymap('n', 'd<Space>', '<Cmd>Lspsaga hover_doc<CR>')
  keymap('n', '<Space>d', '<Cmd>Lspsaga preview_definition<CR>')
  -- Use `lsp-signature` instead
  keymap({ 'n', 'i' }, '<C-k>', '<Cmd>Lspsaga signature_help<CR>')
  -- keymap('n', 'gu', '<Cmd>Lspsaga lsp_finder<CR>')
  keymap('n', 'zi', '<Cmd>Lspsaga code_action<CR>')
  keymap('x', 'zi', '<Cmd>Lspsaga range_code_action<CR>')
  keymap('n', 'zo', '<Cmd>Lspsaga show_line_diagnostics<CR>')
  keymap('n', 'zj', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
  keymap('n', 'zk', '<Cmd>Lspsaga diagnostic_jump_prev<CR>')
  -- Rename symbols, using <Opt-r>
  keymap('n', '®', '<Cmd>Lspsaga rename<CR>')
end

-- MarkdownPreview
if tap 'vim-markdown-preview' then
  vim.cmd [[
    augroup HanaMarkdownPreview
      autocmd!
      autocmd FileType markdown nnoremap <buffer> <silent> <CR> :<C-u>call Vim_Markdown_Preview_Local()<CR>
    augroup END
  ]]
end

-- NeoTree
if tap 'neo-tree.nvim' then
  -- Toggle NeoTree, using <Opt-;>
  keymap('n', '…', '<Cmd>Neotree toggle<CR>')
  -- Find current file in NeoTree, using <Opt-Shift-;>
  keymap('n', 'Ú', '<Cmd>Neotree reveal<CR>')
end

-- NvimTree
if tap 'nvim-tree.lua' then
  -- Toggle NeoTree, using <Opt-;>
  keymap('n', '…', '<Cmd>NvimTreeToggle<CR>')
  -- Find current file in NeoTree, using <Opt-Shift-;>
  keymap('n', 'Ú', '<Cmd>NvimTreeFindFile<CR>')
end

-- PlantumlPreviewer
if tap 'plantuml-previewer.vim' then
  vim.cmd [[
    augroup HanaPlantUmlPreviewer
      autocmd!
      autocmd FileType plantuml nnoremap <buffer> <silent> <CR> :<Cmd>PlantumlOpen<CR>
    augroup END
  ]]
end

-- Telescope
if tap 'telescope.nvim' then
  keymap('n', '<C-P>', '<Cmd>Telescope find_files<CR>')
  keymap('n', '<C-O>', '<Cmd>Telescope buffers<CR>')
end

-- SplitJoin
if tap 'splitjoin.vim' then
  keymap('n', 'gS', '<Plug>SplitjoinSplit')
  keymap('n', 'gJ', '<Plug>SplitjoinJoin')
  keymap('n', 'gs', "<Cmd>exe'SplitjoinJoin'<Bar>exe'SplitjoinSplit'<CR>")
  keymap('n', 'gj', "<Cmd>exe'SplitjoinSplit'<Bar>exe'SplitjoinJoin'<CR>")
end

-- SymbolsOutline
if tap 'symbols-outline.nvim' then
  -- keymap('n', 'K', '<Cmd>SymbolsOutline<CR>')
end

-- Trouble
if tap 'trouble.nvim' then
  keymap('n', '<LocalLeader>z<Space>', '<Cmd>TroubleToggle<CR>')
end

-- TreeSitterIndentObject
if tap 'trouble.nvim' then
  local ts_io = require 'treesitter_indent_object.textobj'
  -- select context-aware indent
  keymap({ 'x', 'o' }, 'ai', function()
    ts_io.select_indent_outer()
  end)
  -- ensure selecting entire line (like caI)
  keymap({ 'x', 'o' }, 'aI', function()
    ts_io.select_indent_outer(true)
  end)
  -- select inner block (only if block, only else block, etc.)
  keymap({ 'x', 'o' }, 'ii', ts_io.select_indent_inner)
  -- select entire inner range (including if, else, etc.)
  keymap({ 'x', 'o' }, 'oi', function()
    ts_io.select_indent_inner(true)
  end)
end

-- Undotree
if tap 'undotree' then
  keymap('n', 'U', function()
    -- call vim.fn.tempname() to ensure that the file is created
    vim.fn.tempname()
    vim.cmd 'UndotreeToggle | wincmd p'
  end)
end
