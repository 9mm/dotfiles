-- https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/plugins/telescope.lua

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          disable_devicons = true,
        },
        live_grep = {
          disable_devicons = true,
        },
        buffers = {
          disable_devicons = true,
          sort_mru = true,
          ignore_current_buffer = true,
          mappings = {
            i = {
              ['<C-d>'] = 'delete_buffer', -- this overrides the built in preview scroller
              ['<C-b>'] = 'preview_scrolling_down',
            },
            n = {
              ['<C-d>'] = 'delete_buffer', -- this overrides the built in preview scroller
              ['<C-b>'] = 'preview_scrolling_down',
            },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = 'smart_case',       -- or 'ignore_case' or 'respect_case'
        },
        ['ui-select'] = {
          require('telescope.themes').get_cursor(),
        },
      },
    })

    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
    telescope.load_extension('project')
  end,
  keys = {
    {
      '<C-p>',
      function() require('telescope.builtin').find_files() end,
      desc = 'Find file',
    },
    {
      '<Leader>fb',
      function() require('telescope.builtin').buffers() end,
      desc = 'Find buffer',
    },
    {
      '<Leader>gg',
      function() require('telescope.builtin').live_grep() end,
      desc = 'Live grep', -- uses ripgrep
    },
    {
      '<Leader>p',
      function() require('telescope').extensions.project.project({}) end,
      desc = 'Switch project',
    },
  },
  cmd = {
    'Telescope',
  },
}
