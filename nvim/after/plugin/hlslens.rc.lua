local hl_exists, hlslens = pcall(require, 'hlslens')
local sb_exists = pcall(require, 'scrollbar')

if not hl_exists then
  return
end

local hlslens_config = {
  calm_down = true,
  -- override_lens = function() end,
  override_lens = function(render, pos_list, nearest, index, rel_index)
    local offset = math.abs(rel_index) < 2 and '' or math.abs(rel_index)
    local direction = rel_index < 0 and 'N' or (rel_index < 1 and '' or 'n')
    -- local text = ('[%s%s %d/%d]'):format(offset, direction, index, #pos_list)
    -- local text = (' %s%s '):format(offset, direction)
    local text = offset .. direction
    text = text == '' and '' or ' ' .. text .. ' '
    local chunks
    if nearest then
      chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLensNear' } }
    else
      chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLens' } }
    end
    local row, col = unpack(pos_list[index])
    render.setVirt(0, row - 1, col - 1, chunks, nearest)
  end,
}

if sb_exists then
  require('scrollbar.handlers.search').setup(hlslens_config)
else
  hlslens.setup(hlslens_config)
end

vim.cmd [[
  hi link HlSearchLens LineNr
]]

  -- hi link HlSearchNear IncSearch
  -- hi link HlSearchLensNear IncSearch
  -- hi link HlSearchFloat IncSearch

-- vim.cmd [[
--   hi link HlSearchNear IncSearch
--   hi link HlSearchLens WildMenu
--   hi link HlSearchLensNear IncSearch
--   hi link HlSearchFloat IncSearch
-- ]]

-- local hlslens_config = {
--   override_lens = function(render, pos_list, nearest, index, rel_index)
--     local offset = math.abs(rel_index) < 2 and ' ' or math.abs(rel_index)
--     local direction = rel_index < 0 and 'N' or (rel_index < 1 and ' ' or 'n')
--     local text = ('[%s%s %d/%d]'):format(offset, direction, index, #pos_list)
--     local chunks
--     if nearest then
--       chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLensNear' } }
--     else
--       chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLens' } }
--     end
--     local row, col = unpack(pos_list[index])
--     render.setVirt(0, row - 1, col - 1, chunks, nearest)
--   end,
-- }
