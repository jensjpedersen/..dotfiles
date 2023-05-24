
local opts = { noremap=true, silent=true, buffer=0 }
vim.keymap.set('n', '<leader>x', ':w<CR>:!lua %<CR>', opts)
