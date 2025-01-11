--                          __
-- .-----.-----.-----.--.--|__.--------.
-- |     |  -__|  _  |  |  |  |        |
-- |__|__|_____|_____|\___/|__|__|__|__|

-- essentials
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.opt.termguicolors = true

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("zesty.plugins", {
  change_detection = {
    enabled = true,
    notify = false,
  },
  ui = {
    backdrop = 100,
  },
})

-- gui
require("zesty.gui")

-- keymaps
require("zesty.keymaps")

-- autocommands
require("zesty.autocommands")

-- aesthetic
vim.opt.guifont = "JetBrainsMono Nerd Font:h14"

-- indentation
vim.opt.autoindent  = true -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab    = true -- <tab> at the start of a line behaves as expected
vim.opt.expandtab   = true -- <tab> inserts spaces
vim.opt.shiftwidth  = 2    -- >>, << shift line by 4 spaces
vim.opt.tabstop     = 2    -- <tab> appears as 4 spaces
vim.opt.softtabstop = 2    -- <tab> behaves as 4 spaces when editing

-- cursor
vim.opt.guicursor = "n-v-c-sm:block,r-cr-o:hor20,i-ci-ve:blinkwait100-blinkoff600-blinkon600"
vim.g.neovide_cursor_unfocused_outline_width = 0.125

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1" -- auto:1

-- wrap
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true

-- scroll
vim.opt.scrolloff = 4
vim.opt.mouse = "nv"
vim.opt.mousescroll = "ver:2,hor:0"

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- folds
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- recovery
vim.opt.backup = false
vim.opt.undolevels = 1000
vim.opt.undofile = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo//"
vim.opt.swapfile = true
vim.opt.directory = os.getenv("HOME") .. "/.local/state/nvim/swap//"

-- misc
vim.opt.updatetime = 50
vim.opt.timeout = true
vim.opt.timeoutlen = 600
vim.opt.shortmess:append("I")

-- filetypes
vim.filetype.add({
  extension = {
    pcss = "css",
  },
})

-- providers
vim.g.python3_host_prog = os.getenv("HOME") .. "/.local/share/nvim/.venv/bin/python"
