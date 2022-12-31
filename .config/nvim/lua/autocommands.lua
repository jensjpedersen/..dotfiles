
-- Terminal automatic insert mode
vim.api.nvim_command('autocmd TermOpen,BufWinEnter term://* startinsert')

-- Auto cd
vim.cmd('autocmd BufEnter * silent! lcd %:p:h')

-- Remember folds and last position
vim.api.nvim_command('autocmd BufWinLeave *.* mkview')
vim.api.nvim_command('autocmd BufWinEnter *.* silent! loadview')


-- -- Vimdiff
-- vim.cmd[[
-- autocmd DiffUpdated,BufEnter * if &diff | set cursorline | endif 
-- ]]
-- use lua 

-- Vimwiki
-- vim.cmd('autocmd BufReadPost,BufNewFile *.md set filetype=vimwiki')

-- Matlab
vim.cmd('autocmd BufRead,BufNewFile *.m set filetype=matlab')
vim.cmd('autocmd BufRead,BufNewFile *.m setlocal commentstring=%\\ %s')

-- Latex 
vim.cmd[[ autocmd BufNewFile,BufRead *.tex 
        \ set textwidth=79 |
        \ setlocal spell spelllang=en,nb ]]


-- Calcurse
vim.cmd[[
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown
]]

-- Markdown 
vim.cmd[[
autocmd BufNewFile,BufRead *.md
   \ set textwidth=79 |
]]

-- Tsv 
vim.cmd[[
autocmd BufNewFile,BufRead *.tsv 
    \ set shiftwidth=20 | 
    \ set softtabstop=20 | 
    \ set tabstop=20 
]]


-- Indent lines
-- local mygroup = vim.api.nvim_create_augroup('indent_blankline', { clear = true })
-- vim.api.nvim_create_autocmd( {'BufNewFile', 'BufRead' }, {
--   pattern = {"*.py, *.lua"},
--   group = mygroup,
--   command = 'lua require("indent_blankline").setup {}',
-- })
