
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


-- vim.api.nvim_create_autocmd({"BufEnter", "BufWrite"}, {
--     group = vim.api.nvim_create_augroup("MarkdownMath", { clear = true }), 
--     pattern = {"*.md", "*.tex"},
--     callback = function () require("nabla").enable_virt() end
-- })


-- Tsv 
vim.cmd[[
autocmd BufNewFile,BufRead *.tsv 
    \ set shiftwidth=20 | 
    \ set softtabstop=20 | 
    \ set tabstop=20 
]]

vim.cmd[[autocmd BufNewFile,BufRead *.csv set filetype=csv]]

-- Indent lines
-- local mygroup = vim.api.nvim_create_augroup('indent_blankline', { clear = true })
-- vim.api.nvim_create_autocmd( {'BufNewFile', 'BufRead' }, {
--   pattern = {"*.py, *.lua"},
--   group = mygroup,
--   command = 'lua require("indent_blankline").setup {}',
-- })


-- Reduce tab size for html and css
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.css", "*.html"},
    callback = function() 
        vim.o.tabstop = 2
        vim.o.softtabstop = 2
        vim.o.shiftwidth = 2
    end,
})



--------------- Firefox DevTools - html | css | javascript ----------------
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.css", "*.html", "*.js"},
    callback = function() 
        -- Firefox keybindings
        vim.keymap.set('n', '<leader>dd', [[:call jobstart('xdotool search "Mozilla Firefox" key --clearmodifiers ctrl+shift+z')<CR>]], opts)
        vim.keymap.set('n', '<leader>dt', [[:call jobstart('xdotool search "Mozilla Firefox" key --clearmodifiers ctrl+shift+k')<CR>]], opts)
        vim.keymap.set('n', '<leader>di', [[:call jobstart('xdotool search "Mozilla Firefox" key --clearmodifiers ctrl+shift+c')<CR>]], opts)
        vim.keymap.set('n', '<leader>dm', [[:call jobstart('xdotool search "Mozilla Firefox" key --clearmodifiers ctrl+shift+m')<CR>]], opts)
        vim.keymap.set('n', '<leader>dh', [[:call jobstart('xdotool search "Mozilla Firefox" key --clearmodifiers F12')<CR>]], opts)

        -- Resume debugger 
        vim.keymap.set('n', '<leader>j', [[:call jobstart('xdotool search "Mozilla Firefox" key --clearmodifiers F8')<CR>]], opts)

        -- Reload page
        vim.keymap.set('n', '<leader>k', [[:call jobstart('xdotool search "Mozilla Firefox" key --clearmodifiers ctrl+r')<CR>]], opts)
    end,
})
