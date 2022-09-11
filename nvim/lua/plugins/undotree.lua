local CACHE_DIR = require 'vars'.CACHE_DIR

vim.g.undotree_WindowLayout = 4

if vim.fn.has('persistent_undo') then
  vim.opt.undodir = CACHE_DIR .. '/undofiles/'
  vim.opt.undofile = true
end
