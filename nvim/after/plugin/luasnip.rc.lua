local exists, luasnip = pcall(require, 'luasnip')
if not exists then
  return
end

luasnip.setup {
  snip_env = {
    s = function(...)
      local snip = luasnip.s(...)
      -- we can't just access the global `ls_file_snippets`, since it will be
      -- resolved in the environment of the scope in which it was defined.
      table.insert(getfenv(2).ls_file_snippets, snip)
    end,
    parse = function(...)
      local snip = luasnip.parser.parse(...)
      table.insert(getfenv(2).ls_file_snippets, snip)
    end,
    -- remaining definitions.
  },
}

luasnip.filetype_extend('typescriptreact', { 'typescript' })

require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snippets' }
