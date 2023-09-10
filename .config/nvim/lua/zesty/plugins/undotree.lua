return {
  'mbbill/undotree',
  keys = {
    {
      '<Leader>u',
      function() vim.cmd.UndotreeToggle() end,
      desc = 'Undotree',
    },
  },
}
