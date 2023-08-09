-- move lines
vim.keymap.set('n', '<D-k>', ':m .-2<CR>==', { desc = 'Move line up'})
vim.keymap.set('n', '<D-j>', ':m .+1<CR>==', { desc = 'Move line down'})
vim.keymap.set('x', '<D-k>', ":m '<-2<CR>gv=gv", { desc = 'Move lines up'})
vim.keymap.set('x', '<D-j>', ":m '>+1<CR>gv=gv", { desc = 'Move lines down'})

-- new line in normal mode
vim.keymap.set('n', '<CR>', 'o_<ESC>x')

-- paste and indent
vim.keymap.set('n', '<Leader>v', 'i<C-r><C-o>+<ESC>l=`[`]$', { desc = 'Past block and indent'})

-- fuck ex mode
vim.keymap.set('n', 'Q', '<NOP>')

-- put but without losing original buffer
vim.keymap.set('x', '<Leader>P', '"_dP', { desc = 'Put original'})

-- realtime find/replace word under cursor
vim.keymap.set('n', '<Leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Realtime word replace'})

-- edit vim
vim.keymap.set('n', '<Leader>ev', ':e ~/.config/nvim/init.lua<cr>', { desc = 'Edit init.lua' })

-- dont skip wrapped lines
vim.keymap.set('n', 'k', 'gk', { desc = 'Up' })
vim.keymap.set('n', 'j', 'gj', { desc = 'Down' })

-- toggle wrap
vim.keymap.set('n', '<Leader>ww', ':set invwrap<CR>:set wrap?<CR>', { desc = 'Toggle word-wrap' })

-- delete empty lines
vim.keymap.set('n', '<Leader>del', ':g/^$/d<CR>', { desc = 'Delete empty lines' })

-- clear search
vim.keymap.set('n', '<Leader>n', ':nohls<CR>', { desc = 'Clear search highlight' })

-- better splits
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to split up' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to split down' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to split left' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to split right' })

-- unjoin (overwrites better split... fix later)
vim.keymap.set('n', '<C-j>', 'i<CR><ESC>', { desc = 'Unjoin' })
