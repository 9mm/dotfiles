return {
  'windwp/nvim-ts-autotag',
  event = 'InsertEnter',
  config = function()
    require('nvim-treesitter.configs').setup({
      autotag = {
        enable = true,
      },
    })
  end
}
