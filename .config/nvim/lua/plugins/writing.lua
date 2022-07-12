
local opts = { noremap=true, silent=false }

-- Latex --
-- biber
vim.keymap.set('n', '<localleader>lb',  ':! biber %:r <CR>', opts)

-- vimtex 
vim.cmd([[
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
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

-- Better colorscheme gruvbox (last part of init)
vim.cmd([[
hi VimwikiHeader1 ctermfg=10 cterm=Bold
hi VimwikiHeader2 ctermfg=5  cterm=Bold
hi VimwikiHeader3 ctermfg=6 cterm=Bold
hi VimwikiHeader4 ctermfg=12 cterm=Bold
hi VimwikiHeader5 ctermfg=3 cterm=Bold
hi VimwikiHeader5 ctermfg=9 cterm=Bold
hi VimwikiHeader6 ctermfg=3 cterm=Bold
hi VimwikiPre ctermfg=3
]])




