local CACHE_DIR = require 'vars'.CACHE_DIR
local g = vim.g
local fn = vim.fn
local opt = vim.opt

g.undotree_WindowLayout = 4

if fn.has('persistent_undo') then
  opt.undodir = CACHE_DIR .. '/undofiles/'
  opt.undofile = true
end
