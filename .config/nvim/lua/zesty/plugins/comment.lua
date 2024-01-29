-- if you ever have problems with tsx/vue:
-- https://github.com/numToStr/Comment.nvim#-treesitter

return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    require("Comment").setup()
  end,
}
