local exists, lsp_lens = pcall(require, 'lsp-lens')
if not exists then
  return
end

lsp_lens.setup {}
