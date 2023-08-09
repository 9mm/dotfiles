-- https://github.com/catppuccin/nvim
-- https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/plugins/catppuccin.lua

return {
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
      color_overrides = {
        -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua
        -- https://www.hsluv.org/
        -- https://www.syntaxenvy.com/0714257
        mocha = {
          rosewater = '#f5e0dc',
          flamingo = '#f2cdcd',
          pink = '#f5c2e7',
          mauve = '#cba6f7',
          red = '#f38ba8',
          maroon = '#eba0ac',
          peach = '#fab387',
          yellow = '#f9e2af',
          green = '#a6e3a1',
          teal = '#94e2d5',
          sky = '#89dceb',
          sapphire = '#74c7ec',
          blue = '#89b4fa',
          lavender = '#b4befe',
          text = '#cdd6f4',
          subtext1 = '#bac2de',
          subtext0 = '#a6adc8',
          overlay2 = '#9399b2',
          overlay1 = '#7f849c',
          overlay0 = '#6c7086',
          surface2 = '#585b70',
          surface1 = '#45475a',
          surface0 = '#313244',
          base = '#0f0f12', -- match gui.lua
          mantle = '#181825',
          crust = '#11111b',
        },
      },
      integrations = {
        neotree = false,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    })

    vim.cmd.colorscheme 'catppuccin'
  end,
}
