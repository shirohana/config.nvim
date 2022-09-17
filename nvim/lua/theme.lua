-- opt.t_Co = 256

if vim.fn.has 'termguicolors' then
  vim.opt.termguicolors = true
end

vim.g.neosolarized_termtrans = 1
vim.cmd 'colorscheme NeoSolarized'
