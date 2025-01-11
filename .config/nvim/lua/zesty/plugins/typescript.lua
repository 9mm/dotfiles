return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    ft = {
      "javascript",
      "typescript",
      "vue",
    },
    config = function()
      require("typescript-tools").setup({
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
        settings = {
          separate_diagnostic_server = true,
          expose_as_code_action = "all",
          tsserver_max_memory = "auto",
          tsserver_plugins = {
            "@vue/typescript-plugin",
          },
        },
      })
    end,
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    config = function()
      require("ts-error-translator").setup()
    end,
  }
}
