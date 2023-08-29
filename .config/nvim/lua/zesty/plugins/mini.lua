return {
  {
    'echasnovski/mini.align',
    event = 'InsertEnter',
    version = '*',
    config = function()
      local align = require('mini.align')
      align.setup({
        steps = {
          -- align first column by default
          -- pre_justify = { align.gen_step.filter('n == 1') }
        },
      })
    end,
  },
  {
    'echasnovski/mini.trailspace',
    event = 'BufReadPre',
    version = '*',
    config = function()
      local ts = require('mini.trailspace')

      ts.setup()

      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*' },
        callback = function()
          ts.trim()
          ts.trim_last_lines()
        end,
      })
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    event = 'InsertEnter',
    version = '*',
    config = function()
      local sj = require('mini.splitjoin')

      local gen_hook = sj.gen_hook
      local curly = { brackets = { '%b{}' } }

      -- add trailing comma when splitting inside curly brackets
      local add_comma_curly = gen_hook.add_trailing_separator(curly)

      -- delete trailing comma when joining inside curly brackets
      local del_comma_curly = gen_hook.del_trailing_separator(curly)

      -- pad curly brackets with single space after join
      local pad_curly = gen_hook.pad_brackets(curly)

      sj.setup({
        split = { hooks_post = { add_comma_curly } },
        join  = { hooks_post = { del_comma_curly, pad_curly } },
      })
    end,
  },
}
