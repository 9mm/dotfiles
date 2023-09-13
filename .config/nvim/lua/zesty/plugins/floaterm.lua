return {
  'voldikss/vim-floaterm',
  config = function()
    vim.g.floaterm_title = ''
  end,
  keys = {
    {
      '<Leader>x',
      function() vim.cmd('FloatermNew --title=ZSH --floaterm_autoclose=2 --width=0.7 --height=0.4') end,
      desc = 'ZSH shell',
    },
    {
      '<Leader>z',
      function() vim.cmd('FloatermNew --width=0.95 --height=0.95 lazygit') end,
      desc = 'LazyGit',
    },
  },
}
