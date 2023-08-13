return {
  {
    'kdheepak/lazygit.nvim',
    enabled = false,
    dependencies =  {
      'nvim-lua/plenary.nvim'
    },
    keys = {
      {
        '<Leader>gz',
        function() vim.cmd('LazyGit') end,
        { desc = 'LazyGit' },
      },
    },
  },
}
