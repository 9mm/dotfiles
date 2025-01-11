return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    -- "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    luasnip.config.setup()

    -- currently breaks tab completion after searching a single time
    -- cmp.setup.cmdline("/", {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = {
    --     {
    --       name = "buffer",
    --       keyword_length = 2,
    --     },
    --   },
    -- })

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
        { name = "crates" },
      },
      formatting = {
        expandable_indicator = true,
        fields = {
          "abbr",
          "kind",
          "menu",
        },
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 42,
          ellipsis_char = "...",
          show_labelDetails = false,
        })
      },
    })
  end,
}
