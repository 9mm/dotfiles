return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = {
      "nvim-dap",
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = true,
    dependencies = {
      "nvim-dap",
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
