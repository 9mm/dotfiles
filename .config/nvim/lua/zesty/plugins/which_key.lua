-- currently breaks diagnostics
return {
  'folke/which-key.nvim',
  enabled = false,
  event = 'BufReadPre',
  config = function()
    require('which-key').setup()
  end,
}
