return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.setup()

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        {
          name = "buffer",
          keyword_length = 2,
        },
      },
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- don't use <C-c> as it interferes with normal mode alternative
        ["<C-h>"] = cmp.mapping.abort(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        -- don"t interfere with tabout
        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil,
      }),
      sources = {
        { name = "luasnip" },
        { name = "path", max_item_count = 3 },
        { name = "nvim_lsp", max_item_count = 6 },
        {
          name = "buffer",
          max_item_count = 4,
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
      },
      formatting = {
        expandable_indicator = true,
        fields = { "abbr", "kind", "menu" },
        format = function(entry, item)
          local menu = {
            luasnip = "[LS]",
            path = "[Path]",
            nvim_lsp = "[LSP]",
            buffer = "[Buf]",
          }
          item.menu = menu[entry.source.name]
          return item
        end,
      },
    })
  end,
}
