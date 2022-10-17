local g = vim.g
local opt = vim.opt

-- g.loaded = 1
-- g.loaded_netrwPlugin = 1

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
-- Enable smartcase
-- opt.ignorecase = true
-- opt.smartcase = true
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
vim.cmd [[
augroup HanaEnv
  autocmd!
  autocmd BufRead,BufNewFile * if !did_filetype() && getline(1) =~# '@startuml\>'| setfiletype plantuml | endif
  autocmd BufRead,BufNewFile *.pu,*.uml,*.plantuml,*.puml,*.iuml set filetype=plantuml
  " autocmd BufRead,BufNewFile *.json setlocal foldmethod=syntax
  autocmd FileType plantuml set iskeyword+=$
augroup END
]]
-- autocmd CursorHold *? syntax sync minlines=300
-- autocmd BufRead,BufNewFile *.tsx setf typescriptreact
-- autocmd FileType prisma setlocal commentstring=//\ %s
-- autocmd FileType typescriptreact setlocal
