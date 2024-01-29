return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("project_nvim").setup({
      detection_methods = { "pattern" },
      patterns = { ".git" },
    })
  end,
  keys = {
    {
      "<Leader>p",
      function()
        vim.cmd("Telescope projects")
      end,
      desc = "Switch project",
    }
  },
}
