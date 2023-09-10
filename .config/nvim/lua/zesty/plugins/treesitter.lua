return {
  {
    'nvim-treesitter/playground',
    keys = {
      {
        '<Leader>tsp',
        function() vim.cmd('TSPlaygroundToggle') end,
        desc = 'TS Playground Cursor',
      },
      {
        '<Leader>tsc',
        function() vim.cmd('TSHighlightCapturesUnderCursor') end,
        desc = 'TS Playground Cursor',
      },
      {
        '<Leader>tsi',
        function() vim.cmd('Inspect') end, -- putting here even though it doesn't come from treesitter
        desc = 'Object information',
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPre',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('treesitter-context').setup({
        enable = true,
        mode = 'topline',
        max_lines = 2,
        trim_scope = 'outer',
      })
    end,
  },
  {
    'kiyoon/treesitter-indent-object.nvim',
    keys = {
      {
        'ii',
        function() require('treesitter_indent_object.textobj').select_indent_inner() end,
        mode = {'x', 'o'},
        desc = 'inner indent (partial range)',
      },
      {
        'iI',
        function() require('treesitter_indent_object.textobj').select_indent_inner(true) end,
        mode = {'x', 'o'},
        desc = 'inner indent (entire range)',
      },
      {
        'ai',
        function() require('treesitter_indent_object.textobj').select_indent_outer() end,
        mode = {'x', 'o'},
        desc = 'outer indent',
      },
      {
        'aI',
        function() require('treesitter_indent_object.textobj').select_indent_outer(true) end,
        mode = {'x', 'o'},
        desc = 'outer indent (line-wise)',
      },
    },
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
  },
  {
    'RRethy/nvim-treesitter-endwise',
    event = 'InsertEnter',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'yioneko/nvim-yati',
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup({
        -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
        ensure_installed = {
          'bash',
          'c',
          'comment',
          'css',
          'diff',
          'gitignore',
          'go',
          'html',
          'javascript',
          'json',
          'lua',
          'markdown',
          'python',
          'query',
          'regex',
          'ruby',
          'rust',
          'sql',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
        },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },
        indent = {
          enable = true,
          disable = function(_, bufnr)
            -- only enable for ruby, let yati handle all the rest
            return vim.bo[bufnr].filetype ~= 'ruby'
          end,
        },
        yati = {
          enable = true,
          disable = {},
          default_lazy = true,
          default_fallback = 'auto',
        },
        autotag = {
          enable = true,
        },
        endwise = {
          enable = true,
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
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<Leader>sp'] = '@parameter.inner',
            },
            swap_previous = {
              ['<Leader>sP'] = '@parameter.inner',
            },
          },
        },
      })
    end,
  },
}
