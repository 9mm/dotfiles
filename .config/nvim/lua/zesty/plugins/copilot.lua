-- https://github.com/zbirenbaum/copilot.lua

return {
  'zbirenbaum/copilot.lua',
  enabled = true,
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup({
      suggestion = {
        auto_trigger = true,
        debounce = 100,
        keymap = {
          accept = '<C-l>',
        },
      },
      filetypes = {
        javascript = true,
        typescript = true,
        vue = true,
        ruby = true,
        lua = true,
        go = true,
        ['*'] = false,
      },
      server_opts_overrides = {},
    })
  end,
}
