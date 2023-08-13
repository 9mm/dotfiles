if vim.g.neovide then

  local function close_tab()
    local bufnr = vim.api.nvim_get_current_buf()
    local modified = vim.api.nvim_get_option_value('modified', { buf = bufnr })
    if modified then
      vim.ui.input(
        { prompt = '... unwritten buffer, are you sure? (y/n) ' },
        function(input)
          if input == 'y' then
            vim.cmd('bd!')
          end
        end
      )
    else
      vim.cmd('bd')
    end
    vim.cmd("echo ''")
  end

  local alpha = function()
    return string.format('%x', math.floor(255 * (vim.g.transparency or 0.8)))
  end

  -- padding
  vim.g.neovide_padding_top    = 20
  vim.g.neovide_padding_bottom = 20
  vim.g.neovide_padding_right  = 20
  vim.g.neovide_padding_left   = 20

  -- display
  vim.g.neovide_transparency = 0.0 -- must be 0.0 for menu bar to match
  vim.g.transparency = 0.98
  vim.g.neovide_background_color = '#0f0f12' .. alpha() -- match theme.lua
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_underline_automatic_scaling = true

  -- window
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_confirm_quit = true

  -- animation
  vim.g.neovide_cursor_animation_length = 0 -- 0.06
  vim.g.neovide_cursor_trail_size = 0 -- 0.4
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_scroll_animation_length = 0.3

  -- keys
  vim.g.neovide_input_macos_alt_is_meta = true

  -- command mapping
  vim.keymap.set({ 'i', 'n' }, '<D-a>', '<ESC>ggVG')                              -- select all
  vim.keymap.set({ 'i', 'n' }, '<D-w>', function() close_tab() end)               -- close tab
  vim.keymap.set({ 'i', 'n' }, '<D-[>', function() vim.cmd('BufferPrevious') end) -- previous tab
  vim.keymap.set({ 'i', 'n' }, '<D-]>', function() vim.cmd('BufferNext') end)     -- next tab
  vim.keymap.set('i', '<D-t>', '<C-o>:tabnew<CR><ESC>')                           -- new tab (insert)
  vim.keymap.set('n', '<D-t>', ':tabnew<CR>')                                     -- new tab (insert)
  vim.keymap.set('i', '<D-s>', '<C-o>:w<CR>')                                     -- save (insert)
  vim.keymap.set('n', '<D-s>', ':w<CR>')                                          -- save (normal)
  vim.keymap.set('x', '<D-x>', '"+d')                                             -- cut
  vim.keymap.set('x', '<D-c>', '"+y')                                             -- copy
  vim.keymap.set('i', '<D-v>', '<C-r><C-o>+')                                     -- paste (insert)
  vim.keymap.set('n', '<D-v>', 'i<C-r><C-o>+<ESC>l')                              -- paste (normal)
  vim.keymap.set('x', '<D-v>', '"+P')                                             -- paste (visual)
  vim.keymap.set('c', '<D-v>', '<C-r>+')                                          -- paste (command)
  -- vim.keymap.set('n', '<D-q>', ':q<CR>')                                          -- quit

end
