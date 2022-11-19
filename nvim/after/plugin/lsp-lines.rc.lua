local exists, lsp_lines = pcall(require, 'lsp_lines')
if not exists then
  return
end

lsp_lines.setup {}

vim.diagnostic.config { virtual_lines = false }
