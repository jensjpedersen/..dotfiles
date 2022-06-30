local opts = { noremap=true, silent=true }

-- Vimux settings
vim.keymap.set('n', '<Leader>vp', ':w<CR>:VimuxPromptCommand<CR>', opts)
vim.keymap.set('n', '<Leader>vl', ':w<CR>:VimuxRunLastCommand<CR>', opts)
vim.keymap.set('n', '<Leader>vi', ':VimuxInspectRunner<CR>', opts)
vim.keymap.set('n', '<Leader>vk', ':VimuxInterruptRunner<CR>', opts)
vim.keymap.set('n', '<Leader>vz', ':VimuxZoomRunner<CR>', opts)
vim.keymap.set('n', '<leader>vj', ":w<CR>:VimuxRunCommand('run ' . bufname('%'))<CR>, opts", opts)
vim.keymap.set('n', '<leader>vc', ":w<CR>:VimuxRunCommand('clc')<CR>:VimuxRunCommand('clear all')<CR>", opts)
vim.keymap.set('n', '<leader>vw', ":w<CR>:VimuxRunCommand('workspace')<CR>", opts)
vim.keymap.set('n', '<leader>vd', [[:norm "xyiw<CR>]] .. ":VimuxRunCommand('doc <C-R>x')<CR>", opts)

-- tmux debugg
vim.keymap.set('n', '<leader>ds', ':w<CR>:!tmux send -t left dbquit Enter<CR>', opts)
vim.keymap.set('n', '<leader>dn', ':w<CR>:!tmux send -t left dbcont Enter<CR>', opts)
vim.keymap.set('n', '<leader>dc', ':w<CR>:!tmux send -t left "dbclear all" Enter<CR>', opts)
vim.keymap.set('n', '<leader>de', ':w<CR>:!tmux send -t left "dbstop if error" Enter<CR>', opts)

-- go to first instance of word  
vim.keymap.set('n', 'gd', ':norm *<CR> :vimgrep /<c-r>//g %<CR>', opts)
vim.keymap.set('n', 'gD', ':norm *<CR> :vimgrep /<c-r>//g **/*.m<CR>', opts)


vim.cmd('set filetype=matlab')

-- vim.cmd([[autocmd BufEnter *.m compiler mlint]])
-- Enalbe omnifunc
vim.cmd([[
if has("autocmd") && exists("+omnifunc")
autocmd Filetype matlab
    \ if &omnifunc == "" |
    \ setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
    endif
]])

-- vim.cmd([[
-- function! OpenCompletion()
--     if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
--         call feedkeys("\<C-x>\<C-o>", "n")
--     endif
-- endfunction
-- autocmd InsertCharPre * call OpenCompletion()
-- ]])

-- Omni completion
require'cmp'.setup {
  sources = {
    { name = 'omni' }
  }
}


-- require'cmp'.setup {
--     sources = {
--         { name = "cmp_matlab" },
--     }
-- }
