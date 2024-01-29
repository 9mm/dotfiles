-- examples: https://github.com/honza/vim-snippets/tree/master/snippets
-- snippet format: https://github.com/garbas/vim-snipmate/blob/master/doc/SnipMate.txt#L228

return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  version = "*",
  build = "make install_jsregexp",
  config = function()
    local luasnip = require("luasnip")

    -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#config-options
    luasnip.setup({
      update_events = "TextChanged,TextChangedI",
    })

    require("luasnip.loaders.from_snipmate").lazy_load({
      paths = "~/.config/nvim/snippets",
    })

    vim.keymap.set(
      "n",
      "<Leader>es",
      function()
        require("luasnip.loaders").edit_snippet_files({
          extend = function(ft, paths)
            if #paths == 0 then
              return {
                {
                  "$CONFIG/" .. ft .. ".snippets",
                  string.format("%s/%s.snippets", "~/.config/nvim/snippets", ft),
                }
              }
            end

            return {}
          end
        })
      end,
      { desc = "Edit snippet" }
    )
  end,
}
