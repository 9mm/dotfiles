-- https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/plugins/catppuccin.lua

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      term_colors = true,
      transparent_background = not vim.g.neovide,
      show_end_of_buffer = false,
      no_italic = true,
      no_bold = false,
      no_underline = false,
      styles = {},
      color_overrides = {
        mocha = require("zesty.colors"),
      },
      highlight_overrides = {
        mocha = function(mocha)
          return {
            ["@comment.note"]           = { bg = mocha.none, fg = mocha.teal },
            ["@comment.todo"]           = { bg = mocha.none, fg = mocha.lavender },
            ["@comment.warning"]        = { bg = mocha.none, fg = mocha.peach },
            ["@comment.danger"]         = { bg = mocha.none, fg = mocha.red },
            ["MiniHipatternsImportant"] = { bg = mocha.none, fg = mocha.yellow },
            ["BufferCurrentMod"]        = { fg = mocha.sky },      -- barbar
            ["FloatermBorder"]          = { fg = mocha.surface2 }, -- floaterm
            ["Folded"]                  = { bg = mocha.mantle },
            ["TelescopeSelection"]      = { bg = mocha.surface0 },
            ["TreesitterContext"]       = { bg = mocha.mantle },   -- treesitter-context
          }
        end,
      },
      integrations = {
        barbar = true,
        cmp = true,
        mason = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            warnings = { "undercurl" },
            hints = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotree = true,
        telescope = {
          enabled = true,
        },
        treesitter = true,
        which_key = true,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
