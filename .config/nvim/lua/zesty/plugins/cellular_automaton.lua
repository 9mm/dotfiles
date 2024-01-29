return {
  "Eandrju/cellular-automaton.nvim",
  keys = {
    {
      "<Leader>cr",
      function() vim.cmd("CellularAutomaton make_it_rain") end,
      desc = "Cellular rain",
    },
    {
      "<Leader>cs",
      function() vim.cmd("CellularAutomaton scramble") end,
      desc = "Cellular scramble",
    },
  },
}
