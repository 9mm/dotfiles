return {
  'mfussenegger/nvim-lint',
  enabled = false,
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      go = { 'golangcilint' },
    }
  end,
  keys = {
    {
      '<Leader>l',
      function() require('lint').try_lint() end,
      { desc = 'Lint' },
    },
  }
}
