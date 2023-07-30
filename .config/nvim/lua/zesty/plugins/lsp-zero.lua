-- return {
--   'VonHeikemen/lsp-zero.nvim',
--   enabled = false,
--   branch = 'v2.x',
--   dependencies = {
--     { 'neovim/nvim-lspconfig' },
--     {
--       'williamboman/mason.nvim',
--       build = function()
--         pcall(vim.cmd, 'MasonUpdate')
--       end,
--     },
--     { 'williamboman/mason-lspconfig.nvim' }, -- optional
--     { 'hrsh7th/nvim-cmp' },     -- required
--     { 'hrsh7th/cmp-nvim-lsp' }, -- required
--     { 'L3MON4D3/LuaSnip' },     -- required
--   },
--   config = function()
--     local lsp = require('lsp-zero').preset({})
--
--     lsp.on_attach(function(client, bufnr)
--       lsp.default_keymaps({ buffer = bufnr })
--     end)
--
--     require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
--
--     lsp.setup()
--   end,
-- }

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'dev-v3'
  },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- lsp support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
  },

  -- autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
  },
}
