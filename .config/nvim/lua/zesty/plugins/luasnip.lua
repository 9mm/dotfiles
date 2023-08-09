-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snipmate
-- examples: https://github.com/honza/vim-snippets

return {
  'L3MON4D3/LuaSnip',
  enabled = false,
  event = 'VeryLazy',
  version = '2.*',
  build = 'make install_jsregexp',
  config = function()
    local ls = require('luasnip')

    ls.setup({})

    require('luasnip.loaders.from_snipmate').lazy_load({
      paths = '~/.config/nvim/snippets',
    })

    vim.keymap.set('i', '<Tab>', function() ls.expand_or_jump() end, { silent = true })
    vim.keymap.set('i', '<S-Tab>', function() ls.jump(-1) end, { silent = true })
    vim.keymap.set('i', '<C-e>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
  end
}
