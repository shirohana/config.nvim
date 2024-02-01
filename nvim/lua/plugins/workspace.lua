local Plugins = require('vars').Plugins

---@type LazyPluginSpec
local CtrlSpace = {
  Plugins.CtrlSpace,
  dependencies = { Plugins.Fzf },
  keys = {
    -- Show ctrlspace menu
    { '<LocalLeader>c', '<Cmd>CtrlSpace<CR>' },
    -- Buffer navigating
    -- nnoremap <silent> <C-o> :<C-u>CtrlSpaceBuffers<CR>
    -- Create new workspace, using <Opt-Shift-w>
    -- { '„', '<Cmd>CtrlSpaceNewWorkspace<CR>' },
    -- Load Workspace, using <Opt-w>
    { '∑', '<Cmd>LoadWorkspace<CR>' },
    -- Save workspace, using <Opt-s>
    { 'ß', '<Cmd>SaveWorkspace<CR>' },
    -- Save Workspace with Name, using <Opt-Shift-s>
    { 'Í', '<Cmd>SaveWorkspacePrompt<CR>' },
    -- Rename tab
    { '<LocalLeader>=', '<Cmd>RenameTabLabel<CR>' },
  },
  init = function()
    -- vim.g.CtrlSpaceUseTabline = 0
    vim.g.CtrlSpaceSetDefaultMapping = 0
    -- NOTE: CtrlSpace will create file '.cs_cache' in it
    vim.g.CtrlSpaceCacheDir = require('vars').CACHE_DIR
    -- We'll only used to search buffers, keep it lower
    vim.g.CtrlSpaceSearchTiming = 20
  end,
  config = function()
    -- Initialize workspace manually for custom workspace selector
    vim.fn['ctrlspace#workspaces#SetWorkspaceNames']()
  end,
}

---@type LazyPluginSpec
local NeoTree = {
  Plugins.NeoTree,
  dependencies = {
    Plugins.Nui,
    Plugins.Plenary,
    Plugins.WebDevicons,
  },
  keys = {
    -- Toggle NeoTree, using <Opt-;>
    { '…', '<Cmd>Neotree toggle<CR>' },
    -- Find current file in NeoTree, using <Opt-Shift-;>
    { 'Ú', '<Cmd>Neotree reveal<CR>' },
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
  end,
  opts = {
    use_default_mappings = false,
    window = {
      width = 46,
      mappings = {
        -- ['?'] = 'show_help',
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

-- @todo put into fs.lua
---@type LazyPluginSpec
local Oil = {
  Plugins.Oil,
}

return { CtrlSpace, NeoTree, Oil }
