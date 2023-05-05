local exists, ts_indent_object = pcall(require, 'treesitter_indent_object')
if not exists then
  return
end

ts_indent_object.setup {}
