-- https://github.com/altermo/npairs-integrate-upair

return {
  'altermo/ultimate-autopair.nvim',
  enabled = true,
  event = 'VeryLazy',
  config = function()
    require('ultimate-autopair').setup({
      cmap = false,
      -- can be commented out in next update when he adds disable_in_macro
      extensions = {
        rules = {
          rules = {
            { 'call', function() return not (vim.fn.reg_recording() ~= '' or vim.fn.reg_executing() ~= '') end },
          },
        },
      },
    })
  end
}

-- currently ultimate-autopair does everything we need, but the creator of this
-- library also made npairs-integrate-upair which combines 2 plugins to form
-- a mega plugin. Use that if you push the limits on this one.

-- return {
--   'altermo/npairs-integrate-upair',
--   dependencies = {
--     'windwp/nvim-autopairs',
--     'altermo/ultimate-autopair.nvim',
--   },
--   config = function()
--     require('npairs-int-upair').setup({
--       bs = 'u',
--       npairs_conf = {
--         disable_in_macro = true,
--       },
--       upair_conf = {
--         bs = {
--           indent_ignore = true,
--         },
--       },
--     })
--   end
-- }
