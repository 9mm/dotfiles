return {
  'chrisgrieser/nvim-various-textobjs',
  config = function()
    require('various-textobjs').setup({
      useDefaultKeymaps = false,
    })
    vim.keymap.set({ 'o', 'x' }, 'al', "<cmd>lua require('various-textobjs').lineCharacterwise(true)<CR>", { desc = 'a line' })
    vim.keymap.set({ 'o', 'x' }, 'il', "<cmd>lua require('various-textobjs').lineCharacterwise(false)<CR>", { desc = 'inner line' })
  end,
}
