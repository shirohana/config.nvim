-- CtrlSpace https://github.com/vim-ctrlspace/vim-ctrlspace
local CtrlSpace = {
  'vim-ctrlspace/vim-ctrlspace',
  event = 'VeryLazy',
  dependencies = { 'junegunn/fzf.vim' },
  keys = {
    -- Show ctrlspace menu
    { '<LocalLeader>c', '<Cmd>CtrlSpace<CR>' },
    -- Buffer navigating
    -- nnoremap <silent> <C-o> :<C-u>CtrlSpaceBuffers<CR>
    -- Create new workspace, using <Opt-Shift-w>
    { '„', '<Cmd>CtrlSpaceNewWorkspace<CR>' },
    -- Load Workspace, using <Opt-w>
    { '∑', '<Cmd>LoadWorkspace<CR>' },
    -- Save workspace, using <Opt-s>
    { 'ß', '<Cmd>SaveWorkspace<CR>' },
    -- Save Workspace with Name, using <Opt-Shift-s>
    { 'Í', '<Cmd>SaveWorkspacePrompt<CR>' },
    -- Rename tab
    { '<LocalLeader>=', '<Cmd>RenameTabLabel<CR>' },
  },
  config = function()
    local CACHE_DIR = require('vars').CACHE_DIR
    local g = vim.g

    -- Disable default mappings
    g.CtrlSpaceSetDefaultMapping = 0

    -- NOTE: CtrlSpace will create file '.cs_cache' in it
    g.CtrlSpaceCacheDir = CACHE_DIR

    -- We'll only used to search buffers, keep it lower
    g.CtrlSpaceSearchTiming = 20

    -- Replace fzf#buffers
    -- command! CtrlSpaceBuffers
    --       \ call fzf#run({
    --       \ 'source': values(ctrlspace#api#Buffers(tabpagenr())),
    --       \ 'sink': 'e',
    --       \ 'down': '20%'
    --       \ })

    -- Initialize workspace manually for custom workspace selector
    vim.fn['ctrlspace#workspaces#SetWorkspaceNames']()
  end,
}

-- Fzf https://github.com/junegunn/fzf.vim
local Fzf = {
  'junegunn/fzf.vim',
  cmd = {
    'FzfAg',
    'Files',
    'GFiles',
    'Buffers',
    'Ag',
    'Tags',
    'BTags',
    'Marks',
    'Windows',
    'History',
    'Maps',
    'Filetypes',
  },
  keys = {
    { '<C-p>', '<Cmd>Files<CR>' },
    -- Search text, using <Opt-f>
    { 'ƒ', ':<C-u>Ag<Space>' },
  },
  config = function()
    vim.env.FZF_DEFAULT_COMMAND =
      "ag -g '' --hidden --path-to-ignore ~/.fzf.ignore"
    vim.env.FZF_DEFAULT_OPTS = '--height 20% --reverse --border --multi'
  end,
  dependencies = {
    { 'junegunn/fzf', build = ':call fzf#install()' },
  },
}

-- NeoTree https://github.com/nvim-neo-tree/neo-tree.nvim
local NeoTree = {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = { 'nui.nvim', 'nvim-tree/nvim-web-devicons', 'plenary.nvim' },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
  end,
  keys = {
    -- Toggle NeoTree, using <Opt-;>
    { '…', '<Cmd>Neotree toggle<CR>' },
    -- Find current file in NeoTree, using <Opt-Shift-;>
    { 'Ú', '<Cmd>Neotree reveal<CR>' },
  },
  opts = {
    use_default_mappings = false,
    window = {
      width = 32,
      mappings = {
        ['?'] = 'show_help',
        ['o'] = 'open',
        ['s'] = 'open_vsplit',
        ['S'] = 'open_split',
        ['<CR>'] = 'toggle_preview',
        ['x'] = 'close_node',
        ['zM'] = 'close_all_nodes',
        ['zR'] = 'expand_all_nodes',
        ['zm'] = 'close_all_nodes',
        ['zr'] = 'expand_all_nodes',
        ['ma'] = { 'add', config = { show_path = 'relative' } },
        ['mc'] = { 'copy', config = { show_path = 'relative' } },
        ['mm'] = { 'move', config = { show_path = 'relative' } },
        ['md'] = 'delete',
        ['y'] = 'copy_to_clipboard',
        ['c'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['q'] = 'close_window',
        ['R'] = 'refresh',
        ['['] = 'prev_source',
        [']'] = 'next_source',
      },
    },
    filesystem = {
      bind_to_cwd = false,
      window = {
        mappings = {
          ['i'] = 'toggle_hidden',
          ['ƒ'] = 'fuzzy_finder', -- <Opt-f>
          ['fd'] = 'fuzzy_finder_directory',
          ['ff'] = 'filter_on_submit',
          ['<C-x>'] = 'clear_filter',
          ['U'] = 'navigate_up',
          ['C'] = 'set_root',
          [';k'] = 'prev_git_modified',
          [';j'] = 'next_git_modified',
        },
      },
    },
    buffers = {
      window = {
        mappings = {
          -- ['<bs>'] = 'navigate_up',
          -- ['.'] = 'set_root',
          -- ['bd'] = 'buffer_delete',
        },
      },
    },
    git_status = {
      window = {
        mappings = {
          -- ['A'] = 'git_add_all',
          -- ['gu'] = 'git_unstage_file',
          -- ['ga'] = 'git_add_file',
          -- ['gr'] = 'git_revert_file',
          -- ['gc'] = 'git_commit',
          -- ['gp'] = 'git_push',
          -- ['gg'] = 'git_commit_and_push',
        },
      },
    },
  },
}

return {
  CtrlSpace,
  Fzf,
  NeoTree,
}
