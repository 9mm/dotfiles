return {
  "romgrk/barbar.nvim",
  init = function() vim.g.barbar_auto_setup = false end,
  config = function()
    require("barbar").setup({
      animation = false,
      auto_hide = false,
      tabpages = false,
      insert_at_end = false,
      icons = {
        button = "",
        filetype = {
          enabled = false,
        },
        modified = {
          button = "●",
        },
      },
    })

    for _, n in pairs({ "1", "2", "3", "4", "5" }) do
      vim.keymap.set({ "n" }, "<D-" .. n .. ">", function() vim.cmd("BufferGoto " .. n) end, { desc = "Tab " .. n })
    end

    vim.keymap.set({ "n" }, "<M-[>", function() vim.cmd("BufferMovePrevious") end, { desc = "Move tab left" })
    vim.keymap.set({ "n" }, "<M-]>", function() vim.cmd("BufferMoveNext") end, { desc = "Move tab right" })
  end,
}
