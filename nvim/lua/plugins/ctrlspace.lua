local CACHE_DIR = require('vars').CACHE_DIR

local g = vim.g

-- Disable default mappings
g.CtrlSpaceSetDefaultMapping = 0

-- NOTE: CtrlSpace will create file '.cs_cache' in it
g.CtrlSpaceCacheDir = CACHE_DIR

-- We'll only used to search buffers, keep it lower
g.CtrlSpaceSearchTiming = 20

-- Replace fzf#buffers
-- command! CtrlSpaceBuffers
--       \ call fzf#run({
--       \ 'source': values(ctrlspace#api#Buffers(tabpagenr())),
--       \ 'sink': 'e',
--       \ 'down': '20%'
--       \ })

-- Initialize workspace manually for custom workspace selector
vim.fn['ctrlspace#workspaces#SetWorkspaceNames']()
