
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.o.number = true
vim.o.relativenumber = true

-- Indent
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Backup
vim.o.swapfile = false
vim.o.undodir = '/home/jensjp/.config/nvim/undodir/'
vim.o.undofile = true

-- style 
vim.o.signcolumn = 'yes'
-- vim.cursorline = 'yes'
-- vim.o.colorcolumn = '80'

-- Etc
vim.o.clipboard = 'unnamedplus'
vim.o.wrap = false
vim.o.mouse = 'a'

vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 0

-- Plugins 
vim.cmd [[
set nocompatible
filetype plugin on
syntax on
]]

