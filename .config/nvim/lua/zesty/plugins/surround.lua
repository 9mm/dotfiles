-- https://github.com/kylechui/nvim-surround/blob/main/lua/nvim-surround/config.lua

return {
  "kylechui/nvim-surround",
  version = "*",
  event = "InsertEnter",
  config = function()
    require("nvim-surround").setup()
  end,
}
