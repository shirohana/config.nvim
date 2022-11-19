local exists, ts_textobjects = pcall(require, 'ts_textobjects')
if not exists then
  return
end

ts_textobjects.setup {}
