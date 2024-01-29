return {
  "sontungexpt/url-open",
  event = "VeryLazy",
  config = function()
    require("url-open").setup({
      open_app = "default",
    })
  end,
  keys = {
    {
      "gz",
      function() vim.cmd("URLOpenUnderCursor") end,
      desc = "Open URL",
    }
  },
}
