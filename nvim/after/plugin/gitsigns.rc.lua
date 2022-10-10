local exists, gitsigns = pcall(require, 'gitsigns')
if not exists then
  return
end

gitsigns.setup {
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

    -- Hunk navigating
    keymap('n', 'sj', gitsigns.next_hunk)
    keymap('n', 'sk', gitsigns.prev_hunk)

    -- Stage hunk
    keymap({ 'n', 'v' }, '<LocalLeader>ss', gitsigns.stage_hunk)
    -- Unstage whole file
    keymap('n', '<LocalLeader>su', gitsigns.reset_buffer_index)

    -- Hard reset hunk
    keymap('n', '<LocalLeader>sr', gitsigns.reset_hunk)
    -- Hard reset whole file
    keymap('n', '<LocalLeader>sR', gitsigns.reset_buffer)

    -- Toggle hunk preview
    keymap('n', '<LocalLeader>s<Space>', gitsigns.preview_hunk)
    -- Blame line
    keymap('n', '<LocalLeader>sa', gitsigns.toggle_current_line_blame)
    -- Blame line with whole commit
    keymap('n', '<LocalLeader>sb', function()
      gitsigns.blame_line { full = true }
    end)
    -- Diff with HEAD
    keymap('n', '<LocalLeader>sd', function()
      gitsigns.diffthis '~'
    end)

    -- Select in hunk
    keymap({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
  end,
}
