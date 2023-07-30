return {
  'kylechui/nvim-surround',
  version = '*',
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup({
      -- https://github.com/kylechui/nvim-surround/blob/main/lua/nvim-surround/config.lua 
    })
  end,
}
