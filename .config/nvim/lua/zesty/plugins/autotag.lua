return {
  'windwp/nvim-ts-autotag',
  config = function()
    require('nvim-treesitter.configs').setup({
      autotag = {
        enable = true,
      },
    })
  end
}
