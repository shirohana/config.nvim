require 'env'
require 'mappings'
require 'abbrs'
require 'theme'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

local NVIM_DIR = require('vars').NVIM_DIR
local opt = vim.opt

opt.runtimepath:prepend { NVIM_DIR .. '/vim' }
