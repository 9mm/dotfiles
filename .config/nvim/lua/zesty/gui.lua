if vim.g.neovide then

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
  vim.g.transparency = 0.95
  vim.g.neovide_background_color = '#000000' .. alpha()
  vim.g.neovide_refresh_rate_idle = 5

  -- window
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_confirm_quit = true

  -- animation
  vim.g.neovide_cursor_animation_length = 0 -- 0.06
  vim.g.neovide_cursor_trail_size = 0 -- 0.4
  vim.g.neovide_cursor_animate_command_line = false

  -- command mapping
  vim.keymap.set('n', '<D-q>', ':q<CR>')       -- quit
  vim.keymap.set('n', '<D-w>', ':bd<CR>')      -- close window
  vim.keymap.set('n', '<D-a>', '<ESC>ggVG')    -- select all
  vim.keymap.set('n', '<D-s>', ':w<CR>')       -- save
  vim.keymap.set('v', '<D-x>', '"+d')          -- cut
  vim.keymap.set('v', '<D-c>', '"+y')          -- copy
  --vim.keymap.set('i', '<D-v>', '<ESC>l"+P`]i') -- paste insert mode
  vim.keymap.set('i', '<D-v>', '<C-r>+') -- paste insert mode
  vim.keymap.set('n', '<D-v>', '"+Pv`]=`]')    -- paste normal mode
  vim.keymap.set('v', '<D-v>', '"+Pv`]=`]')    -- paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-r>+')       -- paste command mode

end
