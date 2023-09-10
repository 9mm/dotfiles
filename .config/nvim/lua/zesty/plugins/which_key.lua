return {
  'folke/which-key.nvim',
  enabled = true,
  event = 'BufReadPre',
  config = function()
    require('which-key').setup()
  end,
}
