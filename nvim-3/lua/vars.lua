local M = {}

M.NVIM_DIR = vim.fn.fnamemodify(vim.fn.expand '<sfile>', ':h')
M.CACHE_DIR = vim.env.HOME .. '/.cache/nvim'

M.Icons = {
  Action = '',
  Array = '',
  Boolean = '',
  Bug = '',
  Class = '',
  CodeComment = '',
  Color = '',
  Comment = '',
  Constant = '󰏿',
  Constructor = '',
  Enum = '',
  EnumMember = '',
  Error = '',
  Event = '',
  Field = '',
  File = '󰈙',
  Folder = '',
  Function = '󰊕',
  Hint = '',
  Info = '', -- 
  Interface = '',
  Key = '󰌋',
  Keyword = '',
  Method = '󰆧',
  Module = '󰏖',
  Namespace = '󰮴',
  Null = '󰟢',
  Number = '󰎠',
  Object = '󰅩',
  Operator = '',
  Other = '',
  Package = '󰏗',
  Property = '',
  Reference = '󰈇',
  Snippet = '',
  String = '',
  Struct = '󰙅',
  Text = '󰉿',
  TypeParameter = '',
  Unit = '',
  Value = '󰎠',
  Variable = '',
  Warning = '',
}

return M
