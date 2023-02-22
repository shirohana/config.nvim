local cmp = require 'cmp'
local lspkind = require 'lspkind'
local luasnip = require 'luasnip'

local function get_document_color(entry, vim_item)
  if vim_item.kind == 'Color' and entry.completion_item.documentation then
    local _, _, r, g, b = string.find(
      entry.completion_item.documentation,
      '^rgb%((%d+), (%d+), (%d+)'
    )
    if r then
      return string.format('%02x', r)
        .. string.format('%02x', g)
        .. string.format('%02x', b)
    end
  end
end

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
  window = {
    completion = {
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local symbol_kind = vim_item.kind
      local symbol_icon = lspkind.symbolic(vim_item.kind)
      local color = get_document_color(entry, vim_item)

      if color then
        symbol_icon = ' '
        local hl_group = 'Tw_' .. color
        if vim.fn.hlID(hl_group) < 1 then
          vim.api.nvim_set_hl(0, hl_group, { bg = '#' .. color })
        end
        vim_item.kind_hl_group = hl_group
      end

      vim_item.kind = ' ' .. symbol_icon .. ' '
      vim_item.menu = '  (' .. symbol_kind .. ')'
      vim_item.abbr = string.sub(vim_item.abbr, 1, 50)

      return vim_item
    end,
    menu = {
      buffer = '‹Buffer›',
      nvim_lsp = '‹LSP›',
    },
  },
}
