local Icons = require('vars').Icons

-- stylua: ignore
local NavicTheme = {
  NavicIconsField         = { fg = '#B5585F', bg = 'NONE' },
  NavicIconsProperty      = { fg = '#B5585F', bg = 'NONE' },
  NavicIconsEvent         = { fg = '#B5585F', bg = 'NONE' },

  NavicText               = { fg = '#82AAFF', bg = 'NONE' },
  NavicIconsEnum          = { fg = '#C3E88D', bg = 'NONE' },
  NavicIconsKey           = { fg = '#C3E88D', bg = 'NONE' },

  NavicIconsConstant      = { fg = '#FFE082', bg = 'NONE' },
  NavicIconsConstructor   = { fg = '#FFE082', bg = 'NONE' },

  NavicIconsFunction      = { fg = '#A377BF', bg = 'NONE' },
  NavicIconsStruct        = { fg = '#A377BF', bg = 'NONE' },
  NavicIconsClass         = { fg = '#A377BF', bg = 'NONE' },
  NavicIconsModule        = { fg = '#A377BF', bg = 'NONE' },
  NavicIconsOperator      = { fg = '#A377BF', bg = 'NONE' },

  NavicIconsVariable      = { fg = '#7E8294', bg = 'NONE' },
  NavicIconsFile          = { fg = '#7E8294', bg = 'NONE' },

  NavicIconsMethod        = { fg = '#6C8ED4', bg = 'NONE' },
  NavicIconsEnumMember    = { fg = '#6C8ED4', bg = 'NONE' },

  NavicIconsInterface     = { fg = '#58B5A8', bg = 'NONE' },
  NavicIconsTypeParameter = { fg = '#58B5A8', bg = 'NONE' },

  NavicIconsNamespace     = { fg = '#0087ff', bg = 'NONE' },
  NavicIconsPackage       = { fg = '#0087ff', bg = 'NONE' },
  NavicIconsString        = { fg = '#0087ff', bg = 'NONE' },
  NavicIconsNumber        = { fg = '#0087ff', bg = 'NONE' },
  NavicIconsBoolean       = { fg = '#0087ff', bg = 'NONE' },
  NavicIconsArray         = { fg = '#0087ff', bg = 'NONE' },
  NavicIconsObject        = { fg = '#0087ff', bg = 'NONE' },
  NavicIconsNull          = { fg = '#0087ff', bg = 'NONE' },
  NavicSeparator          = { fg = '#004657', bg = 'NONE' },
}

-- CmpNvimLsp https://github.com/hrsh7th/cmp-nvim-lsp
local CmpNvimLsp = 'hrsh7th/cmp-nvim-lsp'

-- DocumentColor https://github.com/mrshmllow/document-color.nvim
local DocumentColor = {
  'mrshmllow/document-color.nvim',
  opts = {
    mode = 'background',
  },
}

-- Fidget https://github.com/j-hui/fidget.nvim
local Fidget = {
  'j-hui/fidget.nvim',
  opts = {
    text = {
      spinner = 'dots',
    },
  },
}

-- LspKind https://github.com/onsails/lspkind-nvim
local LspKind = {
  'onsails/lspkind-nvim',
  opts = {
    symbol_map = Icons,
  },
  config = function(_, opts)
    require('lspkind').init(opts)
  end,
}

-- LspSaga https://github.com/tami5/lspsaga.nvim
local LspSaga = {
  'tami5/lspsaga.nvim',
  keys = {
    { 'd<Space>', '<Cmd>Lspsaga hover_doc<CR>' },
    { '<Space>d', '<Cmd>Lspsaga preview_definition<CR>' },
    -- Use `lsp-signature` instead
    {
      '<C-k>',
      '<Cmd>Lspsaga signature_help<CR>',
      { mode = { 'n', 'i' } },
    },
    -- keymap('n', 'gu', '<Cmd>Lspsaga lsp_finder<CR>')
    { 'zi', '<Cmd>Lspsaga code_action<CR>' },
    { 'zi', '<Cmd>Lspsaga range_code_action<CR>',    { mode = 'x' } },
    { 'zo', '<Cmd>Lspsaga show_line_diagnostics<CR>' },
    { 'zj', '<Cmd>Lspsaga diagnostic_jump_next<CR>' },
    { 'zk', '<Cmd>Lspsaga diagnostic_jump_prev<CR>' },
    -- Rename symbols, using <Opt-r>
    { '®', '<Cmd>Lspsaga rename<CR>' },
    -- { '<Space>k', '<Cmd>Lspsaga signature_help<CR>' },
    -- { '<Space>u', '<Cmd>Lspsaga show_line_diagnostics<CR>' },
    -- { '<Space>o', '<Cmd>Lspsaga diagnostic_jump_next<CR>' },
    -- { '<Space>i', '<Cmd>Lspsaga diagnostic_jump_prev<CR>' },
    -- { '<Space>r', '<Cmd>Lspsaga rename<CR>' },
    -- { '<Space>a', '<Cmd>Lspsaga code_action<CR>' },
    -- { '<Space>f', '<Cmd>Lspsaga lsp_finder<CR>' },
    -- { '<Space>q', '<Cmd>Lspsaga close_floaterm<CR>' },
  },
  opts = {
    border_style = 'round',
    code_action_icon = string.format('%s ', Icons.Action),
    diagnostic_header_icon = string.format(' %s  ', Icons.Bug),
    error_sign = Icons.Error,
    hint_sign = Icons.Hint,
    infor_sign = Icons.Info,
    warn_sign = Icons.Warning,
    -- finder_definition_icon = '  ',
    -- finder_reference_icon = '  ',
  },
}

-- LuaDev https://github.com/folke/neodev.nvim
local LuaDev = {
  'folke/neodev.nvim',
  opts = {
    experimental = {
      pathStrict = true,
    },
  },
}

-- Mason https://github.com/williamboman/mason.nvim
local Mason = {
  'williamboman/mason.nvim',
  build = ':MasonUpdate',
  config = true,
}

-- MasonLspConfig https://github.com/williamboman/mason-lspconfig.nvim
local MasonLspConfig = 'williamboman/mason-lspconfig.nvim'

-- LspConfig https://github.com/neovim/nvim-lspconfig
local LspConfig = {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/nvim-cmp',
    CmpNvimLsp,
    DocumentColor,
    LspKind,
    LspSaga,
    LuaDev,
    Mason,
    MasonLspConfig,
  },

  -- Copied from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua
  opts = {
    -- diagnostics = {
    --   underline = true,
    --   update_in_insert = false,
    --   virtual_text = {
    --     spacing = 4,
    --     source = 'if_many',
    --     prefix = '●',
    --   },
    --   severity_sort = true,
    -- },
    servers = {
      jsonls = {},
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
      tailwindcss = {},
      tsserver = {
        cmd = { 'typescript-language-server', '--stdio' },
        filetypes = {
          'javascript',
          'typescript',
          'typescript.tsx',
          'typescriptreact',
        },
      },
    },
    setups = {},
  },

  init = function()
    vim.lsp.set_log_level 'warn'
    vim.lsp.handlers['textDocument/publishDiagnostics'] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          virtual_text = {
            spacing = 4,
            prefix = '',
          },
        })
  end,

  config = function(_, opts)
    local on_attach = function(client, bufnr)
      if client.server_capabilities.colorProvider then
        require('document-color').buf_attach(bufnr)
      end

      if client.server_capabilities.documentSymbolProvider then
        require('nvim-navic').attach(client, bufnr)
        vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
      end

      -- when filetype is TypeScript, attach twoslash queries
      -- if client.name == 'tsserver' then
      --   require('twoslash-queries').attach(client, bufnr)
      -- end

      local function bkeymap(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
      end

      -- Enable completion triggered by <c-x><c-o>
      vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- bkeymap('n', 'd<Space>', '<Cmd>lua vim.lsp.buf.hover()<CR>')
      -- bkeymap('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
      bkeymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
      bkeymap('n', 'gu', '<Cmd>lua vim.lsp.buf.references()<CR>')
      bkeymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
      bkeymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
      -- bkeymap('n', 'zj', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
      -- bkeymap('n', 'zk', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
      bkeymap('n', 'z<Space>', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
      -- bkeymap('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
      -- bkeymap('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
      -- bkeymap('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
      -- bkeymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>')
      -- bkeymap('n', '®', '<Cmd>lua vim.lsp.buf.rename()<CR>')
      -- bkeymap('n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
      -- bkeymap('n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
      -- bkeymap('n', '<space>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>')
    end

    local capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities(),
      opts.capabilities or {}
    )

    capabilities.textDocument.colorProvider = {
      dynamicRegistration = true,
    }

    local function server_setup(server_name)
      local server_opts = vim.tbl_deep_extend('force', {
        on_attach = on_attach,
        capabilities = capabilities,
      }, opts.servers[server_name] or {})
      if
          opts.setups[server_name]
          and opts.setups[server_name](server_name, server_opts)
      then
        return
      end
      if opts.setups['*'] and opts.setups['*'](server_name, server_opts) then
        return
      end
      require('lspconfig')[server_name].setup(server_opts)
    end

    for server_name, server_opts in pairs(opts.servers) do
      if not server_opts or not server_opts.mason then
        server_setup(server_name)
      end
    end
  end,
}

-- Navic https://github.com/SmiteshP/nvim-navic
local Navic = {
  'SmiteshP/nvim-navic',
  dependencies = {
    LspConfig,
  },
  opts = {
    depth_limit = 0,
    depth_limit_indicator = '..',
    highlight = true,
    icons = vim.tbl_map(function(v)
      return string.format('%s ', v)
    end, Icons),
    safe_output = true,
    separator = '  ',
  },
  init = function()
    for name, opts in pairs(NavicTheme) do
      vim.api.nvim_set_hl(0, name, opts)
    end
  end,
}

return {
  Fidget,
  Navic,
}
