
-- command! -nargs=* RunSilent
--       \ | execute ':silent !'.'<args>'
--       \ | execute ':redraw!'
-- nnoremap <leader>s :!curl cht.sh/matlab/

local opts = { noremap=true, silent=true, buffer=0 }

vim.keymap.set('n', '<leader>x', ':!python % <CR>', opts)
vim.keymap.set('n', '<leader>x', ':!python % <CR>', opts)

-- Vimux settings
vim.keymap.set('n', '<Leader>vp', ':w<CR>:VimuxPromptCommand<CR>', opts)
vim.keymap.set('n', '<Leader>vl', ':w<CR>:VimuxRunLastCommand<CR>', opts)
vim.keymap.set('n', '<Leader>vi', ':VimuxInspectRunner<CR>', opts)
vim.keymap.set('n', '<Leader>vk', ':VimuxInterruptRunner<CR>', opts)
vim.keymap.set('n', '<Leader>vz', ':VimuxZoomRunner<CR>', opts)
vim.keymap.set('n', '<leader>vj', ':w<CR>:VimuxRunCommand(--run " . bufname("%"))<CR>', opts)
vim.keymap.set('n', '<leader>vc', ':w<CR>:VimuxRunCommand(--clc")<CR>:VimuxRunCommand("clear all")<CR>', opts)
vim.keymap.set('n', '<leader>vw', ':w<CR>:VimuxRunCommand(--workspace")<CR>', opts)
vim.keymap.set('n', '<leader>vm', ':RunSilent i3-msg workspace 10<CR>', opts)
vim.keymap.set('n', '<leader>vd', ':norm --xyiw<CR>:VimuxRunCommand("doc <C-R>x")<CR>', opts)

-- tmux debugg
vim.keymap.set('n', '<leader>ds', ':w<CR>:RunSilent tmux send -t left dbquit Enter<CR>', opts)
vim.keymap.set('n', '<leader>dn', ':w<CR>:RunSilent tmux send -t left dbcont Enter<CR>', opts)
vim.keymap.set('n', '<leader>dc', ':w<CR>:RunSilent tmux send -t left "dbclear all" Enter<CR>', opts)
vim.keymap.set('n', '<leader>de', ':w<CR>:RunSilent tmux send -t left "dbstop if error" Enter<CR>', opts)

-- go to first instance of word  
vim.keymap.set('n', 'gd', ':norm *<CR> :vimgrep /<c-r>//g %<CR>', opts)
vim.keymap.set('n', 'gD', ':norm *<CR> :vimgrep /<c-r>//g **/*.m<CR>', opts)


