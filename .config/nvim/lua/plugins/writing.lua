
local opts = { noremap=true, silent=false }
-- Latex --

-- biber
vim.keymap.set('n', '<localleader>lb',  ':! biber %:r <CR>', opts)

-- vimtex 
vim.cmd([[
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
]])


-- Wimwiki --
-- Set markdown as defualt syntax
vim.cmd[[
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}, 
                    \ {'path': '~/vimwiki2/', 'syntax': 'markdown', 'ext': '.md'}]
]]

vim.cmd[[
let g:vimwiki_table_mappings=0
let g:vimwiki_table_auto_fmt=0
]]

-- -- Better colorscheme fro gruvbox
-- vim.cmd([[
-- hi VimwikiHeader1 ctermfg=10 cterm=Bold
-- hi VimwikiHeader2 ctermfg=5  cterm=Bold
-- hi VimwikiHeader3 ctermfg=6 cterm=Bold
-- hi VimwikiHeader4 ctermfg=12 cterm=Bold
-- hi VimwikiHeader5 ctermfg=3 cterm=Bold
-- hi VimwikiHeader5 ctermfg=9 cterm=Bold
-- hi VimwikiHeader6 ctermfg=3 cterm=Bold
-- hi VimwikiPre ctermfg=3
-- ]])


-- Grammarous --
vim.keymap.set('n', '<localleader>lb',  ':! biber %:r <CR>', opts)
vim.keymap.set('n', '<leader>wn', '<Plug>(grammarous-move-to-next-error)', { silent = true })
vim.keymap.set('n', '<leader>wp', '<Plug>(grammarous-move-to-previous-error)', { silent = true })
vim.keymap.set('n', '<leader>wf', '<Plug>(grammarous-fixit)', { silent = true })
vim.keymap.set('n', '<leader>wc', ':GrammarousCheck<CR>', { silent = true })
vim.keymap.set('n', '<leader>wq', '<Plug>(grammarous-reset)', { silent = true })
