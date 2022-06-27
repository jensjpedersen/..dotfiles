
require('plugins')

vim.o.number=true
vim.o.relativenumber=true

-- Indent
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=4
vim.o.expandtab=true
vim.o.smartindent=true

vim.o.signcolumn='yes'

require('lsp')

require('cmp_config')






