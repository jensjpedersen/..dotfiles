-- vim.api.nvim_set_option('syntax', 'markdown')

local opts = { noremap=true, silent=true }

-- vim.cmd('autocmd BufRead,BufNewFile *.html set foldmethod=marker')
-- vim.cmd[[autocmd FileType html setlocal commentstring=<!--\ %s\ -->]]
vim.api.nvim_set_option('foldmethod', 'marker')
-- vim.api.nvim_set_option('commentstring', [[<!--\ %s\ -->]], 'local')



-- Open file in firefox
vim.keymap.set('n', '<localleader>jv', ':!firefox --new-window % & <CR>', opts)

-- Open file in qutebrowser
-- vim.keymap.set('n', '<localleader>jv', ':!qutebrowser --target window % & <CR>', opts)





-- Disable Treesitter indent and context
vim.cmd('TSDisable indent')
vim.cmd('TSContextDisable')




