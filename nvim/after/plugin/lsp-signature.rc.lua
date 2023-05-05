local exists, sig = pcall(require, 'lsp_signature')
if not exists then
  return
end

-- Disable due to this plugin sometimes didn't close floating window correctly
-- sig.setup {
--   bind = false,
--   floating_windows = false,
--   hint_prefix = ' ',
--   toggle_key = '<C-k>',
-- }
