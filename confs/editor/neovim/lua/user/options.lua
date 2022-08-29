vim.o.confirm = true

-- Tab
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Hybrid number show
vim.o.number = true
vim.o.relativenumber = true

-- Style
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.signcolumn = 'yes'

-- Hl search
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.opt.smartindent = true

-- Perf
vim.o.lazyredraw = true
vim.o.updatetime = 10

-- Misc
vim.o.numberwidth = 5
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.clipboard = 'unnamedplus'

-- File
vim.o.undofile = true
vim.o.swapfile = false
vim.o.fileencoding = 'utf-8'
vim.o.backup = false
vim.o.conceallevel = 3

-- Keyboard
vim.o.timeoutlen = 100
vim.g.mapleader = ' '

-- UI
vim.o.laststatus = 3
vim.o.showmode = false
vim.o.ruler = false
vim.o.pumheight = 10
vim.o.wrap = false
--vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
