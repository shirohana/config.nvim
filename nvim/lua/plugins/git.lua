local Plugins = require('vars').Plugins

---@type LazyPluginSpec
local Fugitive = {
  Plugins.Fugitive,
  cmd = 'Git',
  keys = {
    -- Git status, using <Opt-g>
    { '©', '<Cmd>Git<CR>' },
    { 'gb', '<Cmd>Git blame<CR>' },
  },
}

---@type LazyPluginSpec
local GitSigns = {
  Plugins.GitSigns,
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    current_line_blame_formatter = '<summary> | <author>, <author_time:%Y-%m-%d>',
    current_line_blame_opts = {
      virt_text_pos = 'overlay',
      delay = 0,
    },
    on_attach = function(bufnr)
      local function keymap(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      local gs = package.loaded['gitsigns']

      -- Hunk navigating
      keymap('n', 'sj', gs.next_hunk)
      keymap('n', 'sk', gs.prev_hunk)

      -- Stage hunk
      keymap({ 'n', 'v' }, '<LocalLeader>ss', gs.stage_hunk)
      -- Unstage whole file
      keymap('n', '<LocalLeader>su', gs.reset_buffer_index)

      -- Hard reset hunk
      keymap('n', '<LocalLeader>sr', gs.reset_hunk)
      -- Hard reset whole file
      keymap('n', '<LocalLeader>sR', gs.reset_buffer)

      -- Toggle hunk preview
      keymap('n', '<LocalLeader>s<Space>', gs.preview_hunk)
      -- Blame line
      keymap('n', '<LocalLeader>sa', gs.toggle_current_line_blame)
      -- Blame line with whole commit
      keymap('n', '<LocalLeader>sb', function()
        gs.blame_line { full = true }
      end)
      -- Diff with HEAD
      keymap('n', '<LocalLeader>sd', function()
        gs.diffthis '~'
      end)

      -- Select in hunk
      keymap({ 'o', 'x' }, 'ih', gs.select_hunk)
    end,
  },
}

return { Fugitive, GitSigns }
