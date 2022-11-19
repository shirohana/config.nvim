local exists, hop = pcall(require, 'hop')
if not exists then
  return
end

hop.setup {}
