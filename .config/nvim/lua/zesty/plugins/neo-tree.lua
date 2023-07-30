return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup({
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          path = vim.fn.shellescape(path)
          vim.cmd('!open ' .. path)
        end,
      },
      event_handlers = {
        {
          event = 'file_opened',
          handler = function(file_path)
            vim.cmd('Neotree close')
          end,
        },
      },
      window = {
        width = 30,
        mappings = {
          ['b'] = function() vim.cmd('Neotree focus buffers left', true) end,
          ['f'] = function() vim.cmd('Neotree focus filesystem left', true) end,
          ['o'] = 'open',
          ['O'] = 'system_open',
        },
      },
    })
    vim.keymap.set('n', '<C-g>', ':Neotree toggle<CR>')
  end,
}
