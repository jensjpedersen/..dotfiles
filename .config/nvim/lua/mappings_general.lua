
local opts = { noremap=true, silent=false, buffer=0 }

vim.keymap.set('n', 'Q', ':.!bash<CR>', opts)
vim.keymap.set('v', 'Q', ":'<,'>!bash<CR>", opts)
-- vim.keymap.set('c', 'w!!', 'w!! w !sudo tee % <CR>', opts) FIXME
vim.keymap.set('n', '<leader>x', ':w<CR>:bash % <CR>', opts)
vim.keymap.set('n', '<C-W>5', 'vertical resize 80<CR>', opts)
vim.keymap.set('n', '<C-W>6', 'vertical resize 90<CR>', opts)
vim.keymap.set('n', '<C-W>7', 'vertical resize 100<CR>', opts)
vim.keymap.set('n', '<C-W>8', 'vertical resize 110<CR>', opts)
vim.keymap.set('n', '<C-W>9', 'vertical resize 120<CR>', opts)

-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)
-- vim.keymap.set('n', '', '', opts)

