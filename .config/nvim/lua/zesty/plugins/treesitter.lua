-- https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/plugins/treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    -- extra textobjects
    'nvim-treesitter/nvim-treesitter-textobjects',
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
      -- install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- automatically install missing parsers when entering buffer
      auto_install = true,
      -- list of parsers to ignore installing (for "all")
      ignore_install = {},
      indent = {
        enable = false,
      },
      highlight = {
        enable = true,
        -- setting this to true will run `:h syntax` and tree-sitter at the same time.
        additional_vim_regex_highlighting = false,
      },
      textobjects = {
        select = {
          enable = true,
          -- automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
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
