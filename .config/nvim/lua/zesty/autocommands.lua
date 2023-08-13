-- remember last location in file
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

-- remove windows bullshit
vim.api.nvim_create_autocmd('BufWrite', {
  pattern = { '*' },
  callback = function()
    vim.cmd('%s/\\r//ge')
    vim.opt.fileformat = 'unix'
  end,
})

-- remove bom
vim.api.nvim_create_autocmd('BufWrite', {
  pattern = { '*' },
  callback = function() vim.opt.bomb = false end,
})
