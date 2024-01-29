local function toggle_quickfix()
  for _, win in pairs(vim.api.nvim_list_wins()) do
    if vim.fn.getbufvar(vim.api.nvim_win_get_buf(win), "&buftype") == "quickfix" then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
end

return {
  "yorickpeterse/nvim-pqf",
  event = "VeryLazy",
  config = function()
    require("pqf").setup()
  end,
  keys = {
    {
      "<Leader>qf",
      function() toggle_quickfix() end,
      desc = "Quickfix list",
    },
  },
}
