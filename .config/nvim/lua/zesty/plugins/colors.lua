return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          names = false,
        },
        filetypes = {
          "*";
          css = {
            names = true,
            css = true,
            tailwind = true,
          },
        },
      })
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    config = function()
      local ccc = require("ccc")
      ccc.setup({
        highlighter = {
          auto_enable = false,
          lsp = false,
        },
        -- https://github.com/uga-rosa/ccc.nvim/blob/main/doc/ccc.txt
        -- https://bottosson.github.io/posts/colorpicker/
        inputs = {
          ccc.input.okhsv,
          ccc.input.hsluv,
        },
      })
    end,
    keys = {
      {
        "<leader>cp",
        function() vim.cmd("CccPick") end,
        desc = "Color picker",
      },
    },
  }
}
