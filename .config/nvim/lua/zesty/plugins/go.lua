return {
  "ray-x/go.nvim",
  lazy = true,
  dependencies = {
    "nvim-dap",
    "nvim-dap-ui",
    "nvim-lspconfig",
    "nvim-treesitter",
    "ray-x/guihua.lua",
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    require("go").setup({
      lsp_cfg = {
        capabilities = capabilities,
      },
      -- https://github.com/ray-x/go.nvim/issues/396
    })

    -- gofmt + goimport on save
    local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require("go.format").goimport()
      end,
      group = format_sync_grp,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()'
}
