return {
  'tpope/vim-fugitive',
  event = 'InsertEnter',
  keys = {
    {
      '<Leader>gs',
      ':Git<CR>',
      { desc = 'Fugitive' },
    },
  },
}
