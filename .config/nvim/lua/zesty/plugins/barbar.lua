return {
  'romgrk/barbar.nvim',
  lazy = false,
  init = function() vim.g.barbar_auto_setup = false end,
  config = function()
    require('barbar').setup({
      animation = false,
      auto_hide = false,
      tabpages = false,
      insert_at_end = false,
      icons = {
        button = '',
        filetype = {
          enabled = false,
        },
        modified = {
          button = '●',
        },
      },
    })
  end,
  keys = {
    {
      '<M-[>',
      function() vim.cmd('BufferMovePrevious') end,
      { desc = 'Move tab left' },
    },
    {
      '<M-]>',
      function() vim.cmd('BufferMoveNext') end,
      { desc = 'Move tab right' },
    },
  },
}
