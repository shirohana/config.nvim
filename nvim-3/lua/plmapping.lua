local keymap = vim.keymap.set

local tap = function(name)
  return vim.fn['dein#tap'](name) == 1
end

-- Fzf
if tap 'fzf.vim' then
  vim.cmd [[
    if mapcheck('<C-o>', 'n') == ''
      nnoremap <silent> <C-O> :<Cmd>Buffers<CR>
    endif
  ]]
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

-- MarkdownPreview
if tap 'vim-markdown-preview' then
  vim.cmd [[
    augroup HanaMarkdownPreview
      autocmd!
      autocmd FileType markdown nnoremap <buffer> <silent> <CR> :<C-u>call Vim_Markdown_Preview_Local()<CR>
    augroup END
  ]]
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
