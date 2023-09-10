return {
  'mhartington/formatter.nvim',
  config = function()
    local prettierd = require('formatter.filetypes.javascript').prettierd;

    require('formatter').setup({
      logging = false,
      log_level = vim.log.levels.WARN,
      filetype = {
        javascript = { prettierd },
        typescript = { prettierd },
        vue = { prettierd },
      },
    })
  end,
  keys = {
    {
      '<Leader>fF',
      function() vim.cmd('FormatWrite') end,
      desc = 'Format: Formatter.nvim' ,
    },
  },
}
