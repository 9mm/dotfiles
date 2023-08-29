-- all inspiration from kickstart.nvim
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
    'hrsh7th/cmp-nvim-lsp',
    --'seblj/nvim-echo-diagnostics',
  },
  config = function()
    -- diagnostics setup and keymaps
    vim.diagnostic.config({
      virtual_text = false,
      -- virtual_text = {
      --   source = 'if_many',
      -- },
      float = {
        severity_sort = true,
        border = 'solid',
        source = 'if_many',
      },
      signs = true,
      severity_sort = true,
      update_in_insert = false,
      underline = true,
    })

    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'View current diagnostic' })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
    vim.keymap.set('n', '<Leader>da', vim.diagnostic.setloclist, { desc = 'List diagnostics' })

    -- echo diagnostics to command line (disabled while we give the new way a chance)
    -- local echo_diagnostics = require('echo-diagnostics')
    -- echo_diagnostics.setup({
    --   show_diagnostic_number = true,
    --   show_diagnostic_source = true,
    -- })
    -- vim.api.nvim_create_autocmd('CursorHold', {
    --   pattern = { '*' },
    --   callback = echo_diagnostics.echo_line_diagnostic,
    -- })

    -- lsp specific keymaps
    vim.keymap.set('n', '<Leader>e', function() vim.cmd('EslintFixAll') end, { desc = 'ESLint fix' })

    -- lsp custom attach
    local on_attach = function(_, bufnr)
      local lsp_map = function(mode, keys, func, desc)
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
      end

      -- keymaps taken from kickstart and lsp-zero
      lsp_map('n', 'K', vim.lsp.buf.hover, 'Hover docs')
      lsp_map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature docs')
      lsp_map('n', 'gd', vim.lsp.buf.definition, 'Goto definition')
      lsp_map('n', 'gI', vim.lsp.buf.implementation, 'Goto implementation')
      lsp_map('n', 'go', vim.lsp.buf.type_definition, 'Goto type definition')
      lsp_map('n', 'gr', require('telescope.builtin').lsp_references, 'List references')
      lsp_map('n', '<Leader>rn', vim.lsp.buf.rename, 'Rename symbol')
      lsp_map('n', '<Leader>ca', vim.lsp.buf.code_action, 'Code action')
      lsp_map('n', '<Leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document symbols')
      lsp_map('n', '<Leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace symbols')

      -- not often used
      -- lsp_map('n', 'gD', vim.lsp.buf.declaration, 'Goto declaration')

      -- create a command `:Format` local to the lsp buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format({ async = true })
      end, { desc = 'Format buffer with LSP' })
    end

    -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    local servers = {
      bashls = {
        filetypes = { 'sh', 'zsh' },
      },
      cssls = {},
      eslint = {
        filetypes = { 'javascript', 'typescript', 'vue' },
      },
      gopls = {},
      html = {},
      jsonls = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      psalm = {},
      pyright = {},
      rust_analyzer = {
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = false,
            },
          },
        },
      },
      solargraph = {},
      tailwindcss = {
        suggestions = false,
        filetypes = { 'html', 'css', 'postcss', 'vue' },
      },
      volar = {
        filetypes = { 'javascript', 'typescript', 'vue' }, -- enable takeover mode for js files - https://github.com/johnsoncodehk/volar/discussions/471
      },
      yamlls = {},
    }

    -- mason must be setup first
    require('mason').setup()

    -- fancy lua_ls dev config
    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- ensure the servers above are installed
    local mason_lspconfig = require('mason-lspconfig')

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        local server_settings = servers[server_name] or {}
        require('lspconfig')[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = server_settings,
          filetypes = server_settings.filetypes,
        })
      end
    })
  end,
}
