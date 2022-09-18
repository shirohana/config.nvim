local exists, colorizer = pcall(require, 'colorizer')
if not exists then
  return
end

colorizer.setup {}
