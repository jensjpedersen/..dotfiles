
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
