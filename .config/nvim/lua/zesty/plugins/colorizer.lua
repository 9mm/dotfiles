return {
  {
    'norcalli/nvim-colorizer.lua',
    init = function()
      require('colorizer').setup({
        '*',
      })
    end,
  },
}
