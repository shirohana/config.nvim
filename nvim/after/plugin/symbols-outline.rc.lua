local exists, outlines = pcall(require, 'symbols-outline')
if not exists then
  return
end

outlines.setup {
  keymaps = {
    close = 'K',
    toggle_preview = 'p',
  },
}
