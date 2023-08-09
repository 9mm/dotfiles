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
          handler = function()
            vim.cmd('Neotree close')
          end,
        },
      },
      window = {
        width = 26,
        mappings = {
          ['b'] = function() vim.cmd('Neotree focus buffers left') end,
          ['f'] = function() vim.cmd('Neotree focus filesystem left') end,
          ['o'] = 'open',
          ['O'] = 'system_open',
        },
      },
      default_component_configs = {
        icon = {
          folder_closed = '',
          folder_open = '',
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        components = {
          icon = function(config, node, state)
            -- if node.type == 'directory' then return {} end
            if node.type == 'file' then
              return {
                text = '· ',
                highlight = config.highlight,
              }
            end
            return require('neo-tree.sources.common.components').icon(config, node, state)
          end
        },
      },
    })
    vim.keymap.set('n', '<C-g>', ':Neotree toggle<CR>', { desc = 'Neo-tree' })
  end,
}
