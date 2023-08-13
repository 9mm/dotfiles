return {
  'chrisgrieser/nvim-various-textobjs',
  event = 'InsertEnter',
  config = function()
    local textobjs = require('various-textobjs')

    textobjs.setup({
      useDefaultKeymaps = false,
    })

    vim.keymap.set({ 'o', 'x' }, 'al', function() textobjs.lineCharacterwise(false) end, { desc = 'a line' })
    vim.keymap.set({ 'o', 'x' }, 'il', function() textobjs.lineCharacterwise(true) end, { desc = 'inner line' })
  end,
}
