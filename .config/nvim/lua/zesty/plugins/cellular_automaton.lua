return {
  'Eandrju/cellular-automaton.nvim',
  keys = {
    {
      '<Leader>rain',
      function() vim.cmd('CellularAutomaton make_it_rain') end,
      desc = 'Cellular automaton',
    },
  },
}
