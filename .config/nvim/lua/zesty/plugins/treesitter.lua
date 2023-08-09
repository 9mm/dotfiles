-- https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/plugins/treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  enabled = true,
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'yioneko/nvim-yati',
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
      ensure_installed = {
        -- 'all',
        'bash',
        'c',
        'comment',
        'css',
        'dockerfile',
        'gitignore',
        'go',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'python',
        'query',
        'r',
        'regex',
        'ruby',
        'rust',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      indent = {
        enable = false,
      },
      yati = {
        enable = true, -- disable indent if enabling yati, and vice versa
        disable = {},
        default_lazy = true,
        default_fallback = 'auto',
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['as'] = { query = '@scope', query_group = 'locals' },
          },
        },
      },
    })
  end,
}
