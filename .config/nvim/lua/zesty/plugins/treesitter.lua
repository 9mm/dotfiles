return {
  {
    -- not actually treesitter but so similar it goes here
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({
        useDefaultKeymaps = false,
      })
    end,
    keys = {
      {
        "gG",
        function() require("various-textobjs").entireBuffer() end,
        mode = { "x", "o" },
        desc = "entire buffer",
      },
      {
        "il",
        function() require("various-textobjs").lineCharacterwise("inner") end,
        mode = { "x", "o" },
        desc = "inner line",
      },
      {
        "al",
        function() require("various-textobjs").lineCharacterwise("outer") end,
        mode = { "x", "o" },
        desc = "a line",
      },
      {
        "iS",
        function() require("various-textobjs").subword("inner") end,
        mode = { "x", "o" },
        desc = "inner subword",
      },
      {
        "aS",
        function() require("various-textobjs").subword("outer") end,
        mode = { "x", "o" },
        desc = "a subword",
      },
      {
        "ik",
        function() require("various-textobjs").key("inner") end,
        mode = { "x", "o" },
        desc = "inner KVP key",
      },
      {
        "ak",
        function() require("various-textobjs").key("outer") end,
        mode = { "x", "o" },
        desc = "a KVP key",
      },
      {
        "iv",
        function() require("various-textobjs").value("inner") end,
        mode = { "x", "o" },
        desc = "inner KVP value",
      },
      {
        "av",
        function() require("various-textobjs").value("outer") end,
        mode = { "x", "o" },
        desc = "a KVP value",
      },
      {
        "ix",
        function() require("various-textobjs").htmlAttribute("outer") end,
        mode = { "x", "o" },
        desc = "inner HTML attribute", -- faking because htmlAttribute("inner") is same as vi"
      },
      {
        "ax",
        function() require("various-textobjs").htmlAttribute("outer") end,
        mode = { "x", "o" },
        desc = "a HTML attribute",
      },
    },
  },
  {
    "nvim-treesitter/playground",
    keys = {
      {
        "<Leader>tsp",
        function() vim.cmd("TSPlaygroundToggle") end,
        desc = "TS Playground",
      },
      {
        "<Leader>tsc",
        function() vim.cmd("TSHighlightCapturesUnderCursor") end,
        desc = "TS Playground Cursor",
      },
      {
        "<Leader>tsi",
        function() vim.cmd("Inspect") end, -- putting here even though it doesn"t come from treesitter
        desc = "Object information",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        mode = "topline",
        max_lines = 2,
        trim_scope = "outer",
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "vue" },
    config = function()
      require("nvim-ts-autotag").setup({
        ["vue"] = "html",
      })
    end,
  },
  {
    "kiyoon/treesitter-indent-object.nvim",
    keys = {
      {
        "ii",
        function() require("treesitter_indent_object.textobj").select_indent_inner() end,
        mode = { "x", "o" },
        desc = "inner indent (partial range)",
      },
      {
        "iI",
        function() require("treesitter_indent_object.textobj").select_indent_inner(true) end,
        mode = { "x", "o" },
        desc = "inner indent (entire range)",
      },
      {
        "ai",
        function() require("treesitter_indent_object.textobj").select_indent_outer() end,
        mode = { "x", "o" },
        desc = "outer indent",
      },
      {
        "aI",
        function() require("treesitter_indent_object.textobj").select_indent_outer(true) end,
        mode = { "x", "o" },
        desc = "outer indent (line-wise)",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
      "yioneko/nvim-yati",
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
        ensure_installed = {
          "bash",
          "c",
          "comment",
          "css",
          "diff",
          "gitignore",
          "go",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "lua",
          "luadoc",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "ruby",
          "rust",
          "sql",
          "toml",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false,
        },
        -- prefer mini.bracketed
        -- incremental_selection = {
        --   enable = true,
        --   keymaps = {
        --     init_selection = "gnn",
        --     node_incremental = "grn",
        --     node_decremental = "grm",
        --     scope_incremental = "grc",
        --   },
        -- },
        indent = {
          enable = true,
          disable = function(_, bufnr)
            -- only enable for ruby, let yati handle all the rest
            return vim.bo[bufnr].filetype ~= "ruby"
          end,
        },
        yati = {
          enable = true,
          disable = {},
          default_lazy = true,
          default_fallback = "auto",
        },
        endwise = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              -- prefer mini.ai for argument selection/swap
              -- ["aa"] = "@parameter.outer",
              -- ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["as"] = { query = "@scope", query_group = "locals" },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<Leader>Nf"] = "@function.outer",
            },
            swap_previous = {
              ["<Leader>Pf"] = "@function.outer",
            },
          },
        },
      })
    end,
  },
}
