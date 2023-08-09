return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
  },
  opts = {
    animation = false,
    auto_hide = false,
    tabpages = false,
    insert_at_end = false,
    icons = {
      button = '',
      filetype = {
        enabled = false,
      },
    },
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
}
