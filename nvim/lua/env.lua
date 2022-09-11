local g = vim.g
local opt = vim.opt

-- ======== Global MapLeader ========
-- Primary leader `<Space>` used in global mappings, e.g.:
--   - save, close, buffer-navigating, etc.
-- Secondary leader `;` used in plugin mappings
g.mapleader = ' '
g.maplocalleader = ';'

-- ======== Editor Config ========
-- Always use utf-8
opt.encoding = 'utf-8'
opt.fileencodings = 'ucs-bom,utf-8,shift_jis,default,latin1'
-- Use space
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- ======== Appearance ========
-- Disable guicursor
opt.guicursor = nil
-- Use ruler
opt.colorcolumn = '80,120'
opt.cursorline = true
opt.wrap = false
-- Editor padding
opt.scrolloff = 2
-- autocmd MyAutoCmd TermOpen * setlocal scrolloff=0
-- Rendering
-- opt.nolazyredraw = true

-- ======== Behavior ========
-- Disable mouse
opt.mouse = nil
-- Allow hidden buffers
opt.hidden = true
-- Enable error bells
opt.belloff = nil
opt.errorbells = true

-- ======== Other ========
opt.showcmd = true
-- let g:force_fix_easymotion_cursor = 1
