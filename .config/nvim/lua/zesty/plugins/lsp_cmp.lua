return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    {
      'tzachar/cmp-tabnine',
      build = './install.sh',
    },
  },
  event = 'InsertEnter',
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup()

    require('cmp_tabnine.config'):setup({
      max_lines = 1000,
      max_num_results = 5,
      sort = true,
      run_on_every_keystroke = true,
      snippet_placeholder = '..',
      ignored_file_types = {
        yaml = true,
        json = true,
        sh = true,
      },
      show_prediction_strength = true,
    })

    ---@diagnostic disable-next-line: missing-fields
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- maybe add cmp.mapping.abort()
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete({}),
        ['<C-s>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        -- don't interfere with tabout
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
      }),
      sources = {
        { name = 'buffer', max_item_count = 4 },
        { name = 'luasnip' },
        { name = 'nvim_lsp', max_item_count = 6 },
        { name = 'path', max_item_count = 3 },
        { name = 'cmp_tabnine', max_item_count = 3, group_index = 0 },
      },
      formatting = {
        expandable_indicator = true,
        fields = { 'abbr', 'kind', 'menu' },
        format = function(entry, item)
          local menu = {
            buffer = '[Buf]',
            nvim_lsp = '[LSP]',
            luasnip = '[LS]',
            path = '[Path]',
            cmp_tabnine = '[TN]',
          }
          item.menu = menu[entry.source.name]
          return item
        end,
      },
    })
  end,
}
