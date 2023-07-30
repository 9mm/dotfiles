-- https://github.com/catppuccin/nvim
-- https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/plugins/catppuccin.lua

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  enabled = true,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      no_italic = true,
      integrations = {
        nvimtree = true,
        telescope = true,
      }
    })

    vim.cmd.colorscheme 'catppuccin'
  end,
}
