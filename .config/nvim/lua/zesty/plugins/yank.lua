return {
  "gbprod/yanky.nvim",
  config = function()
    require("yanky").setup({
      ring = {
        history_length = 100,
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 100,
      },
    })
  end,
  keys = {
    {

      "<Leader>y",
      mode = { "n", "x" },
      function() vim.cmd("YankyRingHistory") end,
      desc = "Yank history",
    },
    {
      "y",
      "<Plug>(YankyYank)",
      mode = { "n", "x" },
      desc = "Yank",
    },
    {
      "p",
      "<Plug>(YankyPutAfter)",
      mode = { "n", "x" },
      desc = "Put after",
    },
    {
      "P",
      "<Plug>(YankyPutBefore)",
      mode = { "n", "x" },
      desc = "Put before",
    },
    {
      "gp",
      "<Plug>(YankyGPutAfter)",
      mode = { "n", "x" },
      desc = "Put after, cursor at end",
    },
    {
      "gP",
      "<Plug>(YankyGPutBefore)",
      mode = { "n", "x" },
      desc = "Put before, cursor at end",
    },
  }
}
