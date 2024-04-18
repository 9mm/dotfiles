return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        debounce = 50,
        keymap = {
          accept = "<C-l>",
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
        rust = true,
        sql = true,
        toml = true,
        typescript = true,
        vue = true,
        yaml = false,
        ["*"] = false,
      },
      server_opts_overrides = {},
    })
  end,
}
