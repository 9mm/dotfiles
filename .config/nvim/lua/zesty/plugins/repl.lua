return  {
  "Vigemus/iron.nvim",
  config = function()
    require("iron.core").setup({
      config = {
        scratch_repl = true,
        repl_open_cmd = require("iron.view").bottom(20),
        ignore_blank_lines = true,
      },
    })
  end,
  keys = {
    {
      "<Leader>rpf",
      function() require("iron.core").send_file() end,
      desc = "REPL file",
    },
    {
      "<Leader>rpl",
      function() require("iron.core").send_line() end,
      desc = "REPL line",
    },
    {
      "<Leader>rpl",
      function() require("iron.core").visual_send() end,
      mode = { "x" },
      desc = "REPL lines",
    },
    {
      "<Leader>rpc",
      function() require("iron.core").send(nil, string.char(12)) end,
      desc = "REPL clear",
    },
    {
      "<Leader>rpq",
      function() require("iron.core").close_repl() end,
      desc = "REPL quit",
    },
  },
}
