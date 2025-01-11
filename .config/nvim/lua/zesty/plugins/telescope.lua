-- https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        layout_config = {
          height = 0.80,
        },
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-u>"] = false,
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
              ["<C-d>"] = "delete_buffer", -- this overrides the built in preview scroller
              ["<C-b>"] = "preview_scrolling_down",
            },
            n = {
              ["<C-d>"] = "delete_buffer", -- this overrides the built in preview scroller
              ["<C-b>"] = "preview_scrolling_down",
            },
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_cursor(),
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("ui-select")
    telescope.load_extension("fzf")

    -- keymaps
    vim.keymap.set("n", "<Leader>sh", require("telescope.builtin").help_tags, { desc = "Search help" })
    vim.keymap.set("n", "<Leader>/", function()
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = "Fuzzy search current buffer" })
  end,
  keys = {
    {
      "<C-p>",
      function()
        require("telescope.builtin").find_files({
          find_command = function()
            -- rg in find_files and live_grep respect ~/.ripgreprc
            -- for project-specific settings, use .rgignore and .gitignore
            -- the following flags are prepended if for some reason you need to override
            -- defaults specific to neovim find_files
            -- https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file
            return { "rg", "--files" }
          end,
        })
      end,
      desc = "Find file",
    },
    {
      "<Leader>b",
      function()
        require("telescope.builtin").buffers(require("telescope.themes").get_ivy({
          layout_config = {
            preview_cutoff = 100,
            height = 10,
          },
        }))
      end,
      desc = "Find buffer",
    },
    {
      "<Leader>ff",
      function() require("telescope.builtin").live_grep(require("telescope.themes").get_ivy()) end,
      desc = "Ripgrep",
    },
  },
  cmd = {
    "Telescope",
  },
}
