-- currently breaks diagnostics
return {
  'folke/which-key.nvim',
  enabled = false,
  event = 'VeryLazy',
  opts = {},
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
}
