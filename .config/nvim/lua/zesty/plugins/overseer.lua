return {
  "stevearc/overseer.nvim",
  config = function()
    require("overseer").setup()
  end,
  keys = {
    {
      "<Leader>oo",
      function() vim.cmd("OverseerToggle") end,
      desc = "Overseer open",
    },
    {
      "<Leader>or",
      function() vim.cmd("OverseerRun") end,
      desc = "Overseer run",
    },
  },
}
