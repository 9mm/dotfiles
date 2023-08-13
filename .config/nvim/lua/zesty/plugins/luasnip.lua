-- examples: https://github.com/honza/vim-snippets/tree/master/snippets
-- snippet format: https://github.com/garbas/vim-snipmate/blob/master/doc/SnipMate.txt#L228

return {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  version = '*',
  build = 'make install_jsregexp',
  config = function()
    local ls = require('luasnip')

    -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#config-options
    ls.setup({
      update_events = 'TextChanged,TextChangedI',
    })

    require('luasnip.loaders.from_snipmate').lazy_load({
      paths = '~/.config/nvim/snippets',
    })

    -- keymaps are handled by Tabout
  end,
}
