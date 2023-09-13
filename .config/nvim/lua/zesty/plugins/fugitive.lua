return {
  'tpope/vim-fugitive',
  event = 'InsertEnter',
  keys = {
    {
      '<Leader>gf',
      ':Git<CR>',
      desc = 'Fugitive',
    },
  },
}
