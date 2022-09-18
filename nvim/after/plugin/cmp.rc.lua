local cmp = require 'cmp'
local lspkind = require 'lspkind'
local luasnip = require 'luasnip'

cmp.setup {
  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' },
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'treesitter' },
    { name = 'ultisnips' },
  }, {
    { name = 'buffer' },
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  -- window = {
  --   completion = {
  --     -- winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:Pmenu',
  --     col_offset = -2,
  --     -- side_padding = 0,
  --   },
  -- },
  formatting = {
    format = lspkind.cmp_format { mode = 'symbol_text', maxwidth = 50 },
    -- fields = { 'kind', 'abbr', 'menu' },

    -- format = function(entry, vim_item)
    --   local kind = lspkind.cmp_format { mode = 'symbol_text', maxwidth = 50 }(
    --     entry,
    --     vim_item
    --   )
    --   local strings = vim.split(kind.kind, '%s', { trimempty = true })
    --   kind.kind = strings[1]
    --   kind.menu = '    (' .. strings[2] .. ')'
    --   return kind
    -- end,

    -- menu = {
    --   buffer = '‹Buffer›',
    --   nvim_lsp = '‹LSP›',
    -- },
  },
}

-- vim.cmd [[
--   set completeopt=menuone,noinsert,noselect
--   highlight! default link CmpItemKind CmpItemMenuDefault
-- ]]]]
