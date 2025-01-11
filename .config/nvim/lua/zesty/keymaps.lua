local function custom_return()
  if vim.fn.getbufvar(vim.fn.winbufnr(0), "&buftype") ~= "quickfix" then
    -- handle indenting
    vim.api.nvim_input("o_<Esc>x")
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", false)
  end
end

-- lazy
vim.keymap.set("n", "<Leader>ll", function() vim.cmd("Lazy") end, { desc = "LazyVim" })
vim.keymap.set("n", "<Leader>ls", function() vim.cmd("Lazy sync") end, { desc = "LazyVim sync" })

-- themes
vim.keymap.set("n", "<Leader>vt", function()
  vim.cmd("doautocmd User LazyColorscheme")
  require("telescope.builtin").colorscheme({ ignore_builtins = true, enable_preview = true })
end, { desc = "Change theme" })

-- actions which center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up" })
vim.keymap.set("n", "n", "nzz", { desc = "Next match" })
vim.keymap.set("n", "N", "Nzz", { desc = "Previous match" })

-- paste and indent
vim.keymap.set("n", "<Leader>v", "i<C-r><C-o>+<Esc>l=`[`]$", { desc = "Paste block and indent" })

-- fuck ex mode
vim.keymap.set("n", "Q", "<NOP>")

-- single insert from normal mode
vim.keymap.set("n", "<Space>", function()
  local char = vim.fn.nr2char(vim.fn.getchar())
  vim.cmd("normal i" .. char .. "\x1b")
end, { desc = "Insert single character" })

-- put but without losing original buffer
vim.keymap.set("x", "<Leader>P", '"_dP', { desc = "Put original" })

-- find/replace word under cursor
-- vim.keymap.set("n", "<Leader>rn", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename word under cursor" })
vim.keymap.set("n", "<Leader>rn", function()
  local current_word = vim.fn.expand("<cword>")
  vim.ui.input({
    prompt = "Rename " .. current_word .. ": ",
    default = current_word,
  }, function(new_name)
    if new_name then
      local escaped_word = vim.fn.escape(current_word, "\\/|&")
      local substitute_cmd = ":%s/\\<" .. escaped_word .. "\\>/" .. new_name .. "/g"
      vim.cmd(substitute_cmd)
    end
  end)
end, { desc = "Rename word under cursor" })

-- edit nvim config
vim.keymap.set("n", "<Leader>ev", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit init.lua" })

-- show full path
vim.keymap.set("n", "<Leader>sp", ":echo expand('%:p')<CR>", { desc = "Show path" })

-- dont skip wrapped lines
vim.keymap.set({ "n", "x" }, "k", "gk", { desc = "Up" })
vim.keymap.set({ "n", "x" }, "j", "gj", { desc = "Down" })

-- toggle wrap
vim.keymap.set("n", "<Leader>ww", ":set invwrap<CR>:set wrap?<CR>", { desc = "Toggle word-wrap" })

-- delete empty lines
vim.keymap.set("n", "<Leader>del", ":g/^$/d<CR>", { desc = "Delete empty lines" })

-- clear search
vim.keymap.set("n", "<Leader>n", ":nohls<CR>", { desc = "Clear search highlight" })

-- better splits
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to split up" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to split down" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to split left" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to split right" })
vim.keymap.set("n", "<Tab>", "<C-w>w", { desc = "Move to next split" })
vim.keymap.set("n", "<S-Tab>", "<C-w>W", { desc = "Move to previous split" })

-- unjoin
vim.keymap.set("n", "<C-CR>", "i<CR><Esc>l", { desc = "Unjoin" })

-- fix neovim escape sequences in terminal https://github.com/neovim/neovim/issues/24093
vim.keymap.set("t", "<S-Space>", " ")
vim.keymap.set("t", "<S-CR>", "<CR>")

-- new line in normal mode (must handle quickfix <CR>)
vim.keymap.set("n", "<CR>", custom_return, { desc = "New line below" })
