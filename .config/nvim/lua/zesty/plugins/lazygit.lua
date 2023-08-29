return {
  {
    'kdheepak/lazygit.nvim',
    dependencies =  {
      'nvim-lua/plenary.nvim'
    },
    cmd = { 'LazyGit' },
    keys = {
      {
        '<Leader>gz',
        function() vim.cmd('LazyGit') end,
        { desc = 'LazyGit' },
      },
    },
  },
}
