

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>x', ':w | !python % <CR>', opts)


--nnoremap <leader>s :!curl cht.sh/python/
-- nnoremap <leader>j :w<CR>:silent !echo "python %" > /tmp/vimpipe <CR>:redraw!<CR>
-- nnoremap <leader>c :w<CR>:silent !echo "clear" > /tmp/vimpipe <CR>:redraw!<CR>
-- nnoremap <leader>k :w<CR>:RunSilent kill $(pgrep -f "python %") <CR>

-- vimux mappings
vim.keymap.set('n', '<Leader>vp', ':w<CR>:VimuxPromptCommand<CR>', opts)
vim.keymap.set('n', '<Leader>vl', ':w<CR>:VimuxRunLastCommand<CR>', opts)
vim.keymap.set('n', '<Leader>vi', ':VimuxInspectRunner<CR>', opts)
vim.keymap.set('n', '<Leader>vk', ':VimuxInterruptRunner<CR>', opts)
vim.keymap.set('n', '<leader>vj', ":w<CR>:VimuxRunCommand('%run ' . bufname('%'))<CR>", opts)
vim.keymap.set('n', '<leader>vJ', ":w<CR>:VimuxRunCommand('%run -i ' . bufname('%'))<CR>", opts)
vim.keymap.set('n', '<Leader>vz', ':VimuxZoomRunner<CR>', opts)
vim.keymap.set('n', '<Leader>vc', ':VimuxClearTerminalScreen<CR>', opts)


-- Search 
vim.keymap.set('n', 'sf', ':vimgrep /\\<def\\>/j % <CR>', opts)
vim.keymap.set('n', 'sc', ':vimgrep /\\<class\\>/j % <CR>', opts)

-- go to first instance of word  
vim.keymap.set('n', 'gw', ':norm *<CR> :vimgrep /<c-r>//g %<CR>', opts)
vim.keymap.set('n', 'gW', ':norm *<CR> :vimgrep /<c-r>//g **/*.py<CR>', opts)


-- Debug
vim.keymap.set('n', '<leader>dk', ":call jobstart('tmux send -t left q Enter')<CR>", opts)
vim.keymap.set('n', '<leader>dj', ":call jobstart('tmux send -t left %debug Enter')<CR>", opts)




