
local opts = { noremap=true, silent=true, buffer=0 }

vim.keymap.set('n', '<leader>x', ':w<CR>:!Rscript %<CR>', opts)

-- Vimux settings
vim.keymap.set('n', '<Leader>vp', ':w<CR>:VimuxPromptCommand<CR>', opts)
vim.keymap.set('n', '<Leader>vl', ':w<CR>:VimuxRunLastCommand<CR>', opts)
vim.keymap.set('n', '<Leader>vi', ':VimuxInspectRunner<CR>', opts)
vim.keymap.set('n', '<Leader>vk', ':VimuxInterruptRunner<CR>', opts)
vim.keymap.set('n', '<Leader>vz', ':VimuxZoomRunner<CR>', opts)
vim.keymap.set('n', '<Leader>vc', ':VimuxClearTerminalScreen<CR>', opts)
vim.keymap.set('n', '<leader>vj', ':w<CR>:VimuxRunCommand("Rscript " . bufname("%"))<CR>', opts)
vim.keymap.set('n', '<leader>vw', ':w<CR>:VimuxRunCommand("workspace")<CR>', opts)



