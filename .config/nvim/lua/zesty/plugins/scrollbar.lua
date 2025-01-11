return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      hide_if_all_visible = true,
      handle = {
        blend = 30,
      },
      handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = false,
        search = false,
      },
      excluded_filetypes = {
        "lazy",
        "mason",
        "qf",
        "TelescopePrompt",
        "TelescopeResults",
      }
    })
  end,
}
