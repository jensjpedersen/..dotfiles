
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
vim.o.autochdir = true
vim.o.wrap = false
vim.o.mouse = 'a'

vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 0

-- Remember folds and last position
vim.api.nvim_command('autocmd BufWinLeave *.* mkview')
vim.api.nvim_command('autocmd BufWinEnter *.* silent! loadview')

-- Terminal --
-- Automatic insert mode
vim.api.nvim_command('autocmd TermOpen,BufEnter term://* startinsert')
-- vim.api.nvim_command('autocmd BufEnter term://* startinsert')

vim.api.nvim_command('autocmd BufEnter,TermOpen term://*ranger* set nonumber norelativenumber signcolumn=no')
vim.api.nvim_command('autocmd BufLeave,TermClose term://*ranger* set number relativenumber signcolumn=yes')


