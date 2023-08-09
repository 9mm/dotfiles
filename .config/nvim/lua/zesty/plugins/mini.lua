return {
  {
    'echasnovski/mini.align',
    version = false,
    config = function()
      require('mini.align').setup()
    end
  },
  {
    'echasnovski/mini.trailspace',
    version = false,
    config = function()
      local ts = require('mini.trailspace')

      ts.setup()

      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*' },
        callback = function()
          ts.trim()
          ts.trim_last_lines()
        end,
      })
    end
  },
}
