local exists, surround = pcall(require, 'nvim-surround')
if not exists then
  return
end

surround.setup {}
