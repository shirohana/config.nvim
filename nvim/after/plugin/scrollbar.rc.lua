local exists, scrollbar = pcall(require, 'scrollbar')
if not exists then
  return
end

local theme = require 'themes.solarized_dark'
local colors = theme.colors

scrollbar.setup {
  handle = {
    text = ' ',
    color = '#0b4f60',
  },
  marks = {
    Cursor = {
      text = '□',
      priority = 5,
      color = colors.cyan,
    },
    Search = {
      text = { '◇', '◆' },
      priority = 1,
      color = colors.blue,
    },
    Error = {
      -- text = { '▱', '▰' },
      text = { '□', '■' },
      priority = 2,
      color = colors.red,
    },
    Warn = {
      text = { '□', '■' },
      priority = 3,
      color = colors.yellow,
    },
    Info = {
      text = { '-', '=' },
      priority = 4,
      color = nil,
    },
    Hint = {
      text = { '-', '=' },
      priority = 5,
      color = nil,
    },
    Misc = {
      text = { '-', '=' },
      priority = 6,
      color = nil,
    },
    GitAdd = {
      text = '▏',
      priority = 7,
      color = colors.green,
    },
    GitChange = {
      text = '▏',
      priority = 7,
      color = colors.yellow,
    },
    GitDelete = {
      text = '▏',
      priority = 7,
      color = colors.red,
    },
  },
  excluded_buftypes = {
    'nofile',
    'terminal',
  },
  excluded_filetypes = {
    'LspsagaHover',
    'noice',
    'prompt',
  },
  autocmd = {
    render = {
      'BufWinEnter',
      'TabEnter',
      'TermEnter',
      'WinEnter',
      'CmdwinLeave',
      'TextChanged',
      'VimResized',
      'WinScrolled',
    },
    clear = {
      'BufWinLeave',
      'TabLeave',
      'TermLeave',
      'WinLeave',
    },
  },
  handlers = {
    cursor = true,
    diagnostic = true,
    gitsigns = true,
    handle = true,
    search = true,
  },
}
