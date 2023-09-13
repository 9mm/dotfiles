return {
  'folke/which-key.nvim',
  event = 'BufReadPre',
  config = function()
    require('which-key').setup()
  end,
}
