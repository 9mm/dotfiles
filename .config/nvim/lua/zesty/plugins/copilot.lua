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
        css = true,
        eruby = true,
        go = true,
        html = true,
        javascript = true,
        lua = true,
        php = true,
        ruby = true,
        typescript = true,
        vue = true,
        ['*'] = false,
      },
      server_opts_overrides = {},
    })
  end,
}
