return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "-" },
        changedelete = { text = "~" },
        untracked = { text = "+" },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "-" },
        changedelete = { text = "~" },
      },
    })
  end,
  keys = {
    {
      "<Leader>gb",
      function() vim.cmd("Gitsigns blame_line") end,
      desc = "Git blame line",
    },
    {
      "<Leader>gp",
      function() vim.cmd("Gitsigns preview_hunk") end,
      desc = "Git preview hunk",
    },
    {
      "<Leader>gr",
      function() vim.cmd("Gitsigns reset_hunk") end,
      desc = "Git reset hunk",
    },
  },
}
