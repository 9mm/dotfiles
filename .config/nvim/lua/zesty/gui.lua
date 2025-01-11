if vim.g.neovide then

  local function buffer_modified()
    local bufnr = vim.api.nvim_get_current_buf()
    local modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })
    return modified
  end

  local function close_tab(force)
    -- check if standard file buffer or a new unsaved buffer, otherwise do standard
    -- bd as barbar won't handle quickfix window, neotree, etc
    local bufnr = vim.api.nvim_get_current_buf()
    local bufname = vim.fn.bufname(bufnr)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
    if (buftype == "" and bufname ~= "") then
      vim.cmd(force and "BufferClose!" or "BufferClose")
    else
      vim.cmd(force and "bd!" or "bd")
    end
  end

  local function confirm_close_tab()
    if buffer_modified() then
      local choice = vim.fn.confirm("Save changes?", "&Yes\n&No\n&Cancel")
      if choice == 2 then
        close_tab(true)
      end
    else
      close_tab(false)
    end
  end

  -- padding
  vim.g.neovide_padding_top    = 20
  vim.g.neovide_padding_bottom = 20
  vim.g.neovide_padding_right  = 20
  vim.g.neovide_padding_left   = 20

  -- display
  -- vim.g.neovide_transparency = 0.98
  vim.g.neovide_refresh_rate = 960 -- fps peaks over 1000+ (requires NEOVIDE_VSYNC=0)
  vim.g.neovide_refresh_rate_idle = 60
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_underline_stroke_scale = 1.2

  -- blur
  vim.g.neovide_floating_blur_amount_x = 0.0
  vim.g.neovide_floating_blur_amount_y = 0.0

  -- window
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_confirm_quit = true

  -- animation
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_cursor_animate_command_line = false

  -- other
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"

  -- command mapping
  vim.keymap.set({ "i", "n" }, "<D-a>", "<Esc>ggVG")                              -- select all
  vim.keymap.set({ "i", "n" }, "<D-w>", function() confirm_close_tab() end)       -- close tab
  vim.keymap.set({ "i", "n" }, "<D-[>", function() vim.cmd("BufferPrevious") end) -- previous tab
  vim.keymap.set({ "i", "n" }, "<D-]>", function() vim.cmd("BufferNext") end)     -- next tab
  vim.keymap.set("i", "<D-t>", "<C-o>:tabnew<CR><Esc>")                           -- new tab (insert)
  vim.keymap.set("n", "<D-t>", ":tabnew<CR>")                                     -- new tab (insert)
  vim.keymap.set("i", "<D-s>", "<C-o>:w<CR>")                                     -- save (insert)
  vim.keymap.set("n", "<D-s>", ":w<CR>")                                          -- save (normal)
  vim.keymap.set("x", "<D-x>", '"+dm0i<Esc>`0')                                   -- cut (include insert hack to fix whichkey issue #518)
  vim.keymap.set("x", "<D-c>", '"+y')                                             -- copy
  vim.keymap.set("i", "<D-v>", "<C-r><C-o>+")                                     -- paste (insert)
  vim.keymap.set("n", "<D-v>", "i<C-r><C-o>+<Esc>l")                              -- paste (normal)
  vim.keymap.set("x", "<D-v>", '"+P')                                             -- paste (visual)
  vim.keymap.set("c", "<D-v>", "<C-r>+")                                          -- paste (command)
  vim.keymap.set("n", "<D-z>", "u")                                               -- undo
  vim.keymap.set({ "i", "n" }, "<D-q>", function() vim.cmd("confirm qa") end)     -- quit

end
