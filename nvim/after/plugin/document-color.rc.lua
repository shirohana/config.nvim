local exists, dcolor = pcall(require, 'document-color')
if not exists then
  return
end

dcolor.setup {
  mode = 'background',
}
