return {
  'stevearc/dressing.nvim',
  event = 'VeryLazy',
  config = function()
    require('dressing').setup({
      input = {
        enabled = true,
        border = 'single',
        relative = 'win',
      },
    })
  end
}
