--                          __
-- .-----.-----.-----.--.--|__.--------.
-- |     |  -__|  _  |  |  |  |        |
-- |__|__|_____|_____|\___/|__|__|__|__|

-- essentials
vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.opt.termguicolors = true

-- lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('zesty.plugins', {
  change_detection = {
    enabled = true,
    notify = false,
  },
})

-- gui
require('zesty.gui')

-- keymaps
require('zesty.keymaps')

-- autocommands
require('zesty.autocommands')

-- aesthetic
vim.opt.guifont = 'AnonymicePro Nerd Font:h15'

-- indentation
vim.opt.autoindent  = true -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab    = true -- <tab> at the start of a line behaves as expected
vim.opt.expandtab   = true -- <tab> inserts spaces
vim.opt.shiftwidth  = 2    -- >>, << shift line by 4 spaces
vim.opt.tabstop     = 2    -- <tab> appears as 4 spaces
vim.opt.softtabstop = 2    -- <tab> behaves as 4 spaces when editing

-- cursor
vim.opt.guicursor = ''
--vim.opt.virtualedit = 'all'

-- line numbers
vim.opt.number = true
vim.opt.signcolumn = 'yes:1' -- auto:1'

-- wrap
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
--vim.opt.completeopt = 'menuone,noselect'

-- scroll
vim.opt.scrolloff = 4
vim.opt.mouse = 'nv'
vim.opt.mousescroll = 'ver:2,hor:0'

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- recovery
vim.opt.backup = false
vim.opt.undolevels = 1000
vim.opt.undofile = false
vim.opt.undodir = os.getenv('HOME') .. '/.local/state/nvim/undo//'
vim.opt.swapfile = true
vim.opt.directory = os.getenv('HOME') .. '/.local/state/nvim/swap//'

-- misc
vim.opt.updatetime = 50
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.shortmess = 'I'
