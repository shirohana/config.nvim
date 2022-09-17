local neotree = require 'neo-tree'

vim.g.neo_tree_remove_legacy_commands = 1

neotree.setup {
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
      ['ma'] = { 'add', config = { show_path = 'relative' }},
      ['mc'] = { 'copy', config = { show_path = 'relative' }},
      ['mm'] = { 'move', config = { show_path = 'relative' }},
      ['md'] = 'delete',
      -- ['y'] = 'copy_to_clipboard',
      -- ['x'] = 'cut_to_clipboard',
      -- ['p'] = 'paste_from_clipboard',
      ['q'] = 'close_window',
      ['R'] = 'refresh',
      ['['] = 'prev_source',
      [']'] = 'next_source',
    }
  },
  filesystem = {
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
      }
    }
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
}
