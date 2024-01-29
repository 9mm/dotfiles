return {
  "ojroques/nvim-bufdel",
  config = function()
    require("bufdel").setup({
      quit = false,
    })
  end,
  keys = {
    {
      "<C-b>n",
      function() vim.cmd("tabnew") end,
      desc = "Buffer new",
    },
    {
      "<C-b>d",
      function() vim.cmd("BufferClose") end,
      desc = "Buffer delete",
    },
    {
      "<C-b>D",
      function() vim.cmd("BufferClose!") end,
      desc = "Buffer delete (ignore changes)",
    },
    {
      "<C-b>o",
      function() vim.cmd("BufDelOthers") end,
      desc = "Buffer delete others",
    },
    {
      "<C-b>O",
      function() vim.cmd("BufDelOthers!") end,
      desc = "Buffer delete others (ignore changes)",
    },
    {
      "<C-b>a",
      function() vim.cmd("BufDelAll") end,
      desc = "Buffer delete all",
    },
    {
      "<C-b>A",
      function() vim.cmd("BufDelAll!") end,
      desc = "Buffer delete all (ignore changes)",
    },
  },
}
