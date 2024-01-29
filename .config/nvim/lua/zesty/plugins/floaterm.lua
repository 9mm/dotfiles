local function get_bufnr_from_name(name)
  local buflist = vim.fn["floaterm#buflist#gather"]()
  for _, bufnr in ipairs(buflist) do
    local bufname = vim.fn.getbufvar(bufnr, "floaterm_name")
    if bufname == name then
      return bufnr
    end
  end
  return -1
end

local function toggle_floaterm(args)
  local name = args:match("--name=([^%s]+)")
  local bufnr = get_bufnr_from_name(name)

  if bufnr == -1 then
    vim.cmd("FloatermNew " .. args)
  else
    vim.cmd("FloatermToggle " .. name)
  end
end

return {
  "voldikss/vim-floaterm",
  config = function()
    vim.g.floaterm_title = ""
  end,
  keys = {
    {
      "<Leader>x",
      function() toggle_floaterm("--name=zsh --title=ZSH --autoclose=2 --width=0.7 --height=0.4") end,
      mode = { "n", "t" },
      desc = "ZSH shell",
    },
    {
      "<Leader>z",
      function() toggle_floaterm("--name=lazygit --width=0.98 --height=0.95 lazygit") end,
      mode = { "n", "t" },
      desc = "LazyGit",
    },
  },
}
