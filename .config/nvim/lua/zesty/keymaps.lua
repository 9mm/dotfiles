-- move lines
vim.keymap.set('n', '<D-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<D-k>', ':m .-2<CR>==')
vim.keymap.set('v', '<D-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<D-k>', ":m '<-2<CR>gv=gv")

-- new line in normal mode
vim.keymap.set('n', '<CR>', 'o<ESC>')

-- fuck ex mode
vim.keymap.set('n', 'Q', '<NOP>')

-- put but without losing original buffer
vim.keymap.set('x', '<Leader>p', '"_dP')

-- realtime find/replace word under cursor
vim.keymap.set('n', '<Leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- edit vim
vim.keymap.set('n', '<Leader>ev', ':e ~/.config/nvim/init.lua<cr>')

-- dont skip wrapped lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- toggle wrap
vim.keymap.set('n', '<Leader>ww', ':set invwrap<CR>:set wrap?<CR>')

-- delete empty lines
vim.keymap.set('n', '<Leader>del', ':g/^$/d<CR>')

-- clear search
vim.keymap.set('n', '<Leader>n', ':nohls<CR>')

-- better splits
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
