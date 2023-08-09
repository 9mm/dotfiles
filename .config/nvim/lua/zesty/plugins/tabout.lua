-- https://github.com/abecodes/tabout.nvim
return {
  'abecodes/tabout.nvim',
  enabled = false,
  event = 'VeryLazy',
  dependencies = {
    'nvim-treesitter',
    -- load anything that uses tab first, even if plugin doesn't use it
    'nvim-cmp',
    'L3MON4D3/LuaSnip',
  },
  config = function()
    require('tabout').setup({
      tabkey = '<Tab>',
      backwards_tabkey = '<S-Tab>',
      act_as_tab = true,
      act_as_shift_tab = false,
      default_tab = '<C-t>',
      default_shift_tab = '<C-d>',
      enable_backwards = true,
      completion = true,
      tabouts = {
        {open = "'", close = "'"},
        {open = '"', close = '"'},
        {open = '`', close = '`'},
        {open = '(', close = ')'},
        {open = '[', close = ']'},
        {open = '{', close = '}'}
      },
      ignore_beginning = true,
      exclude = {},
    })
  end,
}
