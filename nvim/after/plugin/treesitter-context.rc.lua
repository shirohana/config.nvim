local exists, context = pcall(require, 'context')
if not exists then
  return
end

context.setup {
  enable = true,
}
