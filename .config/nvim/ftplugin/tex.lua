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



-- require('cmp').setup.buffer { sources = { { name = 'dictionary' } } } 

