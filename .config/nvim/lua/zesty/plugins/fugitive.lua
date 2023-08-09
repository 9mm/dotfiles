return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<Leader>gs', ':Git<CR>', { desc = 'Fugitive' })
  end,
}
