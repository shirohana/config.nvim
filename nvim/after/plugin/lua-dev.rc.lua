local exists, luadev = pcall(require, 'lua-dev')
if not exists then
  return
end

luadev.setup {}
