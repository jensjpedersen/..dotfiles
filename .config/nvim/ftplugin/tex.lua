-- Enalbe omnifunc
-- vim.cmd([[
-- if &omnifunc == ""
--     setlocal omnifunc=syntaxcomplete#Complete 
-- endif
-- ]])


require('cmp').setup.buffer {
    -- formatting = {
    --   format = function(entry, vim_item)
    --       vim_item.menu = ({
    --         omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
    --         buffer = "[Buffer]",
    --         -- formatting for other sources
    --         })[entry.source.name]
    --       return vim_item
    --     end,
    -- },
    sources = {
        { name = 'cmp_tabnine' },
        { name = 'latex_symbols' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'path' },
        -- other sources
    }
}



local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>sf', ':vimgrep /label{fig:/j *.tex<CR>', opts)
vim.keymap.set('n', '<leader>se', ':vimgrep /label{eq:/j *.tex<CR>', opts)
vim.keymap.set('n', '<leader>st', ':vimgrep /label{tab:/j *.tex<CR>', opts)


-- require('cmp').setup.buffer { sources = { { name = 'dictionary' } } } 

