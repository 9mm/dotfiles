return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local colors = {
      rosewater = "#f5e0dc",
      flamingo  = "#f2cdcd",
      pink      = "#f5c2e7",
      mauve     = "#cba6f7",
      red       = "#f38ba8",
      maroon    = "#eba0ac",
      peach     = "#fab387",
      yellow    = "#f9e2af",
      green     = "#a6e3a1",
      teal      = "#94e2d5",
      sky       = "#89dceb",
      sapphire  = "#74c7ec",
      blue      = "#89b4fa",
      lavender  = "#b4befe",
      text      = "#cdd6f4",
      subtext1  = "#bac2de",
      subtext0  = "#a6adc8",
      overlay2  = "#9399b2",
      overlay1  = "#7f849c",
      overlay0  = "#6c7086",
      surface2  = "#585b70",
      surface1  = "#45475a",
      surface0  = "#313244",
      base      = "#1e1e2e",
      mantle    = "#181825",
      crust     = "#11111b",
    }

    local sep_options = {
      default = { left = '', right = '' }, -- 
      round   = { left = '', right = '' },
      block   = { left = '█', right = '█' },
      arrow   = { left = '', right = '' },
    }

    local separators = sep_options['default']

    local theme = {
      -- a = mode, z
      -- b = filename, y
      -- c = branch, diff, diagnostics, x
      normal = {
        a = { bg = colors.sapphire, fg = colors.base, gui = 'bold' },
        b = { bg = colors.surface1, fg = colors.subtext1 },
        c = { bg = colors.surface0, fg = colors.overlay0 },
      },
      insert = {
        a = { bg = colors.green,    fg = colors.base, gui = 'bold' },
        b = { bg = colors.surface1, fg = colors.subtext1 },
        c = { bg = colors.surface0, fg = colors.overlay0 },
      },
      visual = {
        a = { bg = colors.lavender, fg = colors.base, gui = 'bold' },
        b = { bg = colors.surface1, fg = colors.subtext1 },
        c = { bg = colors.surface0, fg = colors.overlay0 },
      },
      replace = {
        a = { bg = colors.red,      fg = colors.base, gui = 'bold' },
        b = { bg = colors.surface1, fg = colors.subtext1 },
        c = { bg = colors.surface0, fg = colors.overlay0 },
      },
      inactive = {
        c = { bg = colors.surface0, fg = colors.overlay0 },
      },
    }

    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = theme,
        component_separators = {
          left = '',
          right = '',
        },
        section_separators = {
          left = separators['left'],
          right = separators['right'],
        },
        disabled_filetypes = {
          'diff',
          'undotree',
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          {
            'filename',
            path = 0,
          },
        },
        lualine_c = {
          {
            'branch',
            icon = '',
            color = { fg = colors.lavender },
          },
          {
            'diff',
            symbols = {
              added    = '+', -- 
              modified = '~', -- 
              removed  = '-', -- 
            },
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.yellow },
              removed = { fg = colors.red },
            },
          },
        },
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            sections = { 'error', 'warn', 'info', 'hint' },
            diagnostics_color = {
              error = 'DiagnosticError',
              warn  = 'DiagnosticWarn',
              info  = 'DiagnosticInfo',
              hint  = 'DiagnosticHint',
            },
            symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
          {
            'filetype',
            colored = false,
            icon_only = false,
            icon = { align = 'right' },
            padding = { left = 1, right = 2 },
          },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      extensions = {
        'neo-tree',
        'lazy',
      },
    })
  end
}
