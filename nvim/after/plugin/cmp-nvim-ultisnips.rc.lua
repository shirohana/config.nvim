local exists, cmp_ultisnips = pcall(require, 'cmp_nvim_ultisnips')
if not exists then
  return
end

cmp_ultisnips.setup {}
