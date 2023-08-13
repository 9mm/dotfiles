-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md

return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'ayu_mirage',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          'diff',
          'undotree',
        },
      },
      sections = {
        lualine_x = {
          'encoding',
          {
            'filetype',
            colored = false,
            icon_only = false,
            icon = { align = 'right' },
          },
        },
      },
      extensions = {
        'neo-tree',
        'lazy',
      },
    })
  end
}
