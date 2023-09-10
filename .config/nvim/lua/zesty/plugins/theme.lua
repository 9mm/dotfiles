-- https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/plugins/catppuccin.lua

return {
  {
    'embark-theme/vim',
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'embark'
    end
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = true,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        transparent_background = not vim.g.neovide,
        show_end_of_buffer = false,
        no_italic = true,
        no_bold = false,
        no_underline = false,
        styles = {},
        -- color_overrides = {
        --   -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua
        --   -- https://www.hsluv.org/
        --   -- https://www.syntaxenvy.com/0714257
        --   mocha = {
        --     rosewater = '#f5e0dc',
        --     flamingo = '#f2cdcd',
        --     pink = '#f5c2e7',
        --     mauve = '#cba6f7',
        --     red = '#f38ba8',
        --     maroon = '#eba0ac',
        --     peach = '#fab387',
        --     yellow = '#f9e2af',
        --     green = '#a6e3a1',
        --     teal = '#94e2d5',
        --     sky = '#89dceb',
        --     sapphire = '#74c7ec',
        --     blue = '#89b4fa',
        --     lavender = '#b4befe',
        --     text = '#cdd6f4',
        --     subtext1 = '#bac2de',
        --     subtext0 = '#a6adc8',
        --     overlay2 = '#9399b2',
        --     overlay1 = '#7f849c',
        --     overlay0 = '#6c7086',
        --     surface2 = '#585b70',
        --     surface1 = '#45475a',
        --     surface0 = '#313244',
        --     base = '#0f0f12', -- match gui.lua
        --     mantle = '#0f0f12', -- #181825
        --     crust = '#0f0f12', -- #11111b
        --   },
        -- },
        highlight_overrides = {
          mocha = function(mocha)
            return {
              ['@text.note.comment']    = { bg = mocha.none, fg = mocha.sapphire },
              ['@text.todo.comment']    = { bg = mocha.none, fg = mocha.peach },
              ['@text.warning.comment'] = { bg = mocha.none, fg = mocha.yellow },
              ['@text.danger.comment']  = { bg = mocha.none, fg = mocha.red },
              ['TreesitterContext']     = { bg = mocha.base },
            }
          end,
        },
        integrations = {
          neotree = false,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          which_key = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { 'undercurl' },
              warnings = { 'undercurl' },
              hints = { 'undercurl' },
              information = { 'undercurl' },
            },
          },
        },
      })

      vim.cmd.colorscheme 'catppuccin'
    end,
  }
}
