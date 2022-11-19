local exists, sig = pcall(require, 'lsp_signature')
if not exists then
  return
end

sig.setup {
  floating_windows = false,
  hint_prefix = ' ',
  toggle_key = '<C-k>',
}
