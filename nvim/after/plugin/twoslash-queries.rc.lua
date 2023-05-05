local exists, two_slash = pcall(require, 'twoslash-queries')
if not exists then
  return
end

two_slash.setup {
  is_enabled = false,
  multi_line = true,
}
