return {
  {
    "echasnovski/mini.ai",
    event = "InsertEnter",
    version = false,
    config = function()
      -- remember there is also incremental_selection in treesitter, although
      -- the keymaps are not as nice as a{a{
      require("mini.ai").setup({
        mappings = {
          around_next = "aN",
          inside_next = "iN",
          -- resolve conflits with line selection
          around_last = "aP",
          inside_last = "iP",
        },
        n_lines = 200,
      })
    end,
  },
  {
    "echasnovski/mini.align",
    event = "InsertEnter",
    version = false,
    config = function()
      local align = require("mini.align")
      align.setup({
        steps = {
          -- align first column by default
          -- pre_justify = { align.gen_step.filter("n == 1") }
        },
      })
    end,
  },
  {
    "echasnovski/mini.bracketed",
    event = "InsertEnter",
    version = false,
    config = function()
      require("mini.bracketed").setup({
        location = {
          options = {
            wrap = false,
          },
        },
        quickfix = {
          options = {
            wrap = false,
          },
        },
      })
    end,
  },
  {
    "echasnovski/mini.files",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.files").setup({
        mappings = {
          go_in = "<C-l>",
          go_in_plus = "<CR>",
          go_out = "",
          go_out_plus = "<C-h>",
        }
      })
    end,
    keys = {
      {
        "<Leader>fe",
        function() require("mini.files").open() end,
        desc = "File explorer",
      },
    },
  },
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.hipatterns").setup({
        highlighters = {
          important = {
            pattern = "IMPORTANT",
            group = "MiniHipatternsImportant",
          },
        },
      })
    end,
  },
  {
    "echasnovski/mini.jump",
    event = "InsertEnter",
    version = false,
    config = function()
      require("mini.jump").setup({
        delay = {
          highlight = 250, -- 10000000 to disable
        },
      })
    end,
  },
  {
    "echasnovski/mini.move",
    event = "InsertEnter",
    version = false,
    config = function()
      require("mini.move").setup({
        mappings = {
          up = "<D-k>",
          down = "<D-j>",
          left = "<C-h>",
          right = "<C-l>",
          line_up = "<D-k>",
          line_down = "<D-j>",
        },
      })
    end,
  },
  {
    "echasnovski/mini.operators",
    event = "InsertEnter",
    version = false,
    config = function()
      require("mini.operators").setup()

      vim.keymap.set("n", "<Leader>ah", function() vim.cmd("normal gxiagxiPa") end, { desc = "Swap argument left" })
      vim.keymap.set("n", "<Leader>al", function() vim.cmd("normal gxiagxiNa") end, { desc = "Swap argument right" })
    end,
  },
  {
    "echasnovski/mini.pick",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.pick").setup()
    end,
    keys = {
      {
        "<Leader>fp",
        function() vim.cmd("Pick files") end,
        desc = "File picker",
      },
    },
  },
  {
    "echasnovski/mini.splitjoin",
    event = "InsertEnter",
    version = false,
    config = function()
      local splitjoin = require("mini.splitjoin")

      local gen_hook = splitjoin.gen_hook
      local curly = { brackets = { "%b{}" } }

      -- add trailing comma when splitting inside curly brackets
      local add_comma_curly = gen_hook.add_trailing_separator(curly)

      -- delete trailing comma when joining inside curly brackets
      local del_comma_curly = gen_hook.del_trailing_separator(curly)

      -- pad curly brackets with single space after join
      local pad_curly = gen_hook.pad_brackets(curly)

      splitjoin.setup({
        split = { hooks_post = { add_comma_curly } },
        join  = { hooks_post = { del_comma_curly, pad_curly } },
      })
    end,
  },
  {
    "echasnovski/mini.trailspace",
    event = "VeryLazy",
    version = false,
    config = function()
      local trailspace = require("mini.trailspace")
      trailspace.setup()

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*" },
        callback = function()
          trailspace.trim()
          trailspace.trim_last_lines()
        end,
      })
    end,
  },
}
