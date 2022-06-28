

local opts = { noremap=true, silent=true, buffer=0 }
vim.keymap.set('n', '<leader>x', ':!python % <CR>', opts)
vim.keymap.set('n', '<leader>x', ':!python % <CR>', opts)


--nnoremap <leader>s :!curl cht.sh/python/
-- nnoremap <leader>j :w<CR>:silent !echo "python %" > /tmp/vimpipe <CR>:redraw!<CR>
-- nnoremap <leader>c :w<CR>:silent !echo "clear" > /tmp/vimpipe <CR>:redraw!<CR>
-- nnoremap <leader>k :w<CR>:RunSilent kill $(pgrep -f "python %") <CR>

-- vimux mappings
vim.keymap.set('n', '<Leader>vp', ':w<CR>:VimuxPromptCommand<CR>')
vim.keymap.set('n', '<Leader>vl', ':w<CR>:VimuxRunLastCommand<CR>')
vim.keymap.set('n', '<Leader>vi', ':VimuxInspectRunner<CR>')
vim.keymap.set('n', '<Leader>vk', ':VimuxInterruptRunner<CR>')
vim.keymap.set('n', '<leader>vj', ":w<CR>:VimuxRunCommand('python ' . bufname('%'))<CR>")
vim.keymap.set('n', '<Leader>vz', ':VimuxZoomRunner<CR>')
vim.keymap.set('n', '<Leader>vc', ':VimuxClearTerminalScreen<CR>')

