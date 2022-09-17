local fn = vim.fn

local M = {}

M.NVIM_DIR = fn.fnamemodify(fn.expand '<sfile>', ':h')
M.CACHE_DIR = vim.env.HOME .. '/.cache/nvim'

M.DEIN_DIR = M.CACHE_DIR .. '/dein'
M.DEIN_REPO_DIR = M.CACHE_DIR .. '/dein/repos/github.com/Shougo/dein.vim'

return M
