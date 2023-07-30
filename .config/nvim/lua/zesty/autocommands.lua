-- strip whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*' },
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
  end,
})

-- remember last location in file
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = { '*' },
  command = [[if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif]]
})

-- remove windows bullshit
vim.api.nvim_create_autocmd('BufWrite', {
  pattern = { '*' },
  callback = function() vim.opt.fileformat = 'unix' end,
})
vim.api.nvim_create_autocmd('BufWrite', {
  pattern = { '*' },
  callback = function() vim.cmd('%s/\\r//ge') end,
})

-- remove bom
vim.api.nvim_create_autocmd('BufWrite', {
  pattern = { '*' },
  callback = function() vim.opt.bomb = false end,
})
