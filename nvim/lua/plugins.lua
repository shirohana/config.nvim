local vars = require 'vars'

local NVIM_DIR = vars.NVIM_DIR
local DEIN_DIR = vars.DEIN_DIR
local DEIN_REPO_DIR = vars.DEIN_REPO_DIR

local DEIN_PLUGINS_TOML = NVIM_DIR .. '/plugins.toml'
local DEIN_FTPLUGINS_TOML = NVIM_DIR .. '/ftplugins.toml'

local fn = vim.fn
local g = vim.g

g['dein#auto_recache'] = 1

if not string.match(vim.o.runtimepath, '/dein.vim') then
  if fn.isdirectory(DEIN_REPO_DIR) ~= 1 then
    os.execute('git clone https://github.com/Shougo/dein.vim ' .. DEIN_REPO_DIR)
  end
  vim.opt.runtimepath:prepend { DEIN_REPO_DIR }
end

if fn['dein#load_state'](DEIN_DIR) == 1 then
  fn['dein#begin'](DEIN_DIR)
  fn['dein#load_toml'](DEIN_PLUGINS_TOML)
  fn['dein#load_toml'](DEIN_FTPLUGINS_TOML, { lazy = 1 })
  fn['dein#end']()
  fn['dein#save_state']()
end

-- filetype plugin indent on
-- syntax enable
