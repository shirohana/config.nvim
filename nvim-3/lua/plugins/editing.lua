local CACHE_DIR = require('vars').CACHE_DIR

-- AutoPairs https://github.com/jiangmiao/auto-pairs
local AutoPairs = {
  'jiangmiao/auto-pairs',
  -- 因為 AutoPairs 是 vim script，暫時無法使用 event 來觸發
  -- event = 'InsertEnter',
  init = function()
    vim.g.AutoPairsCenterLine = 0
    vim.g.AutoPairsFlyMode = 1
    vim.g.AutoPairsMapBS = 1
    vim.g.AutoPairsMapCR = 1
    vim.g.AutoPairsMapCh = 0
    vim.g.AutoPairsMapSpace = 1
    vim.g.AutoPairsMultilineClose = 1
    vim.g.AutoPairsShortcutBackInsert = '<C-B>'
    vim.g.AutoPairsShortcutFastWrap = ''
    vim.g.AutoPairsShortcutJump = ''
    vim.g.AutoPairsShortcutToggle = ''
  end,
}

-- BetterWhitespace https://github.com/ntpeters/vim-better-whitespace
local BetterWhitespace = {
  'ntpeters/vim-better-whitespace',
  event = 'BufEnter',
  init = function()
    vim.g.better_whitespace_operator = 0
    vim.g.show_spaces_that_precede_tabs = 1
    vim.g.strip_whitespace_confirm = 0
    vim.cmd [[
    augroup HanaBetterWhitespace
      autocmd!
      autocmd BufEnter * EnableStripWhitespaceOnSave
    augroup END
    ]]
  end,
}

-- Commentary https://github.com/tpope/vim-commentary
local Commentary = {
  'tpope/vim-commentary',
  event = 'BufEnter',
  keys = {
    { 'gc', '<Plug>Commentary', mode = { 'n', 'o', 'v' } },
    { 'gcc', '<Plug>CommentaryLine' },
    { 'cgc', '<Plug>ChangeCommentary' },
    { 'gcu', '<Plug>Commentary<Plug>Commentary' },
  },
  init = function()
    vim.g.commentary_line_mapping = '<C-_>'
    vim.g.commentary_motion_mapping = '<C-_>'
    vim.g.commentary_nesting = 1
    vim.g.commentary_use_keymap = 0
  end,
}

-- EasyAlign https://github.com/junegunn/vim-easy-align
local EasyAlign = {
  'junegunn/vim-easy-align',
  event = 'BufEnter',
  keys = {
    { 'ga', '<Plug>(EasyAlign)' },
    { 'ga', '<Plug>(LiveEasyAlign)', mode = 'v' },
  },
}
-- Hop https://github.com/phaazon/hop.nvim
local Hop = {
  'phaazon/hop.nvim',
  commit = 'caaccee',
  config = true,
  keys = {
    { '<LocalLeader>j', '<Cmd>HopLineAC<CR>', { mode = '' } },
    { '<LocalLeader>k', '<Cmd>HopLineBC<CR>', { mode = '' } },
    { '<LocalLeader>w', '<Cmd>HopWordAC<CR>', { mode = '' } },
    { '<LocalLeader>b', '<Cmd>HopWordBC<CR>', { mode = '' } },
  },
}

-- Surround https://github.com/kylechui/nvim-surround
local Surround = {
  'kylechui/nvim-surround',
  version = '*', -- Use for stability; omit to use `main` branch for the latest features
  event = 'VeryLazy',
  config = true,
}

-- Undotree https://github.com/mbbill/undotree
local Undotree = {
  'mbbill/undotree',
  cmd = 'UndotreeToggle',
  keys = {
    { 'U', '<Cmd>UndotreeToggle<Bar>wincmd p<CR>' },
  },
  init = function()
    vim.g.undotree_WindowLayout = 4
    if vim.fn.has 'persistent_undo' then
      vim.opt.undodir = CACHE_DIR .. '/undofiles/'
      vim.opt.undofile = true
    end
  end,
}

-- VisualMulti https://github.com/mg979/vim-visual-multi
local VisualMulti = {
  'mg979/vim-visual-multi',
  event = 'VeryLazy',
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ['Add Cursor At Pos'] = ';;\\',
      ['Align Char'] = ';;<',
      ['Align Regex'] = ';;>',
      ['Align'] = ';;a',
      ['Case Conversion Menu'] = ';;C',
      ['Duplicate'] = ';;d',
      ['Find Next'] = ']',
      ['Find Operator'] = 'm',
      ['Find Prev'] = '[',
      ['Find Subword Under'] = '<C-n>',
      ['Find Under'] = '<C-n>',
      ['Goto Next'] = '}',
      ['Goto Prev'] = '{',
      ['Invert Direction'] = 'o',
      ['Merge Regions'] = ';;m',
      ['Numbers Append'] = ';;N',
      ['Numbers'] = ';;n',
      ['Remove Last Region'] = ';;q',
      ['Remove Region'] = 'Q',
      ['Replace Pattern'] = 'R',
      ['Rewrite Last Search'] = ';;r',
      ['Run Ex'] = ';;x',
      ['Run Last Ex'] = ';;X',
      ['Run Last Normal'] = ';;Z',
      ['Run Last Visual'] = ';;V',
      ['Run Macro'] = ';;@',
      ['Run Normal'] = ';;z',
      ['Run Visual'] = ';;v',
      ['Search Menu'] = ';;S',
      ['Seek Next'] = '<C-f>',
      ['Seek Prev'] = '<C-b>',
      ['Select All'] = ';;A',
      ['Show Registers'] = ';;"',
      ['Skip Region'] = 'q',
      ['Split Regions'] = ';;s',
      ['Start Regex Search'] = ';;/',
      ['Surround'] = 'S',
      ['Switch Mode'] = '<Tab>',
      ['Toggle Whole Word'] = ';;w',
      ['Transpose'] = ';;t',
      ['Visual Add'] = ';;a',
      ['Visual All'] = ';;A',
      ['Visual Cursors'] = ';;c',
      ['Visual Find'] = ';;f',
      ['Visual Regex'] = ';;/',
      ['Visual Subtract'] = ';;s',
      ['Zero Numbers Append'] = ';;0N',
      ['Zero Numbers'] = ';;0n',
    }
  end,
}

return {
  AutoPairs,
  BetterWhitespace,
  Commentary,
  EasyAlign,
  Hop,
  Surround,
  Undotree,
  VisualMulti,
}
