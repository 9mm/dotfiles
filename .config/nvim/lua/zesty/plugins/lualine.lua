-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    --'nvim-tree/nvim-web-devicons',
  },
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
        lualine_c = {
          {
            function()
              local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
              local max_severity = 4
              local max_severity_idx
              for i, diagnostic in ipairs(diagnostics) do
                if diagnostic.severity < max_severity then
                  max_severity_idx = i
                end
              end
              return diagnostics[max_severity_idx].message
            end,
            color = function()
              local severities = { 'Error', 'Warn', 'Info', 'Hint' }
              local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
              local max_severity = 4
              for _, diagnostic in ipairs(diagnostics) do
                if diagnostic.severity < max_severity then
                  max_severity = diagnostic.severity
                end
              end
              return 'Diagnostic' .. severities[max_severity]
            end
          }
        },
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
