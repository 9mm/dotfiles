-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes

return {
  'mhartington/formatter.nvim',
  config = function()
    require('formatter').setup({
      logging = false,
      log_level = vim.log.levels.WARN,
      filetype = {
        html = {
          require('formatter.filetypes.html').prettierd,
        },
        javascript = {
          require('formatter.filetypes.javascript').prettierd,
        },
        typescript = {
          require('formatter.filetypes.typescript').prettierd,
        },
        vue = {
          -- prettierd not supported
        },
      },
    })
  end,
  keys = {
    {
      '<Leader>fF',
      function() vim.cmd('FormatWrite') end,
      desc = 'Format: Formatter.nvim',
    },
  },
}
