return {
  "kevinhwang91/nvim-hlslens",
  config = function()
    require('hlslens').setup({
      calm_down = true,
      nearest_only = true,
    })
  end,
  keys = {
    {
      "n",
      mode = { "n" },
      function()
        vim.cmd("execute 'normal! ' .. v:count1 .. 'n'")
        require('hlslens').start()
      end,
      desc = "Next search",
    },
    {
      "N",
      mode = { "n" },
      function()
        vim.cmd("execute 'normal! ' .. v:count1 .. 'N'")
        require('hlslens').start()
      end,
      desc = "Previous search",
    },
    {
      "*",
      mode = { "n" },
      function()
        vim.cmd("normal! *")
        require('hlslens').start()
      end,
      desc = "Search word under cursor",
    },
    {
      "#",
      mode = { "n" },
      function()
        vim.cmd("normal! #")
        require('hlslens').start()
      end,
      desc = "Search word under cursor backwards",
    },
    {
      "g*",
      mode = { "n" },
      function()
        vim.cmd("normal! g*")
        require('hlslens').start()
      end,
      desc = "Search whole word under cursor",
    },
    {
      "g#",
      mode = { "n" },
      function()
        vim.cmd("normal! g#")
        require('hlslens').start()
      end,
      desc = "Search whole word under cursor backwards",
    },
  }
}
