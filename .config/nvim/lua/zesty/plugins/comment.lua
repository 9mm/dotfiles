-- https://github.com/numToStr/Comment.nvim

-- if you ever have problems with tsx/vue:
-- https://github.com/numToStr/Comment.nvim#-treesitter

return {
  'numToStr/Comment.nvim',
  lazy = false,
  config = function()
    require('Comment').setup()
  end,
}
