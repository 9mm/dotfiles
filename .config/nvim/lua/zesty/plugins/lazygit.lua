return {
  {
    'kdheepak/lazygit.nvim',
    enabled = false,
    dependencies =  {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      vim.keymap.set('n', '<Leader>gz', ':LazyGit<CR>', { desc = 'LazyGit'})
    end,
  },
}
