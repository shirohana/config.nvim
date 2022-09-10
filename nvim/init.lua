require 'env'
require 'plugins'
require 'keymaps'
require 'plugin-keymaps'
require 'abbrs'
require 'theme'

local NVIM_DIR = require 'vars'.NVIM_DIR
local opt = vim.opt

opt.runtimepath:prepend { NVIM_DIR .. '/vim' }
