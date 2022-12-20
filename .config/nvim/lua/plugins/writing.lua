
local opts = { noremap=true, silent=false }

-- Latex --

-- biber
vim.keymap.set('n', '<localleader>lb',  ':! biber %:r <CR>', opts)

-- vimtex 
vim.cmd([[
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
" let g:vimtex_view_method='sioyek'
let g:vimtex_quickfix_mode=0
let g:vimtex_view_reverse_search_edit_cmd='edit'
set conceallevel=2
]])

-- Reverse search zathura
vim.cmd[[
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
]]


-- Vimwiki --
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



-- Vimwiki bindings
vim.api.nvim_set_keymap('n' , 'gh', '<Plug>VimwikiAddHeaderLevel', opts)


-- Markdown
-- vim.keymap.set('n', '<localleader>mm',  ':w<CR>:! pandoc % -t latex -o %:r.pdf <CR>', opts)
-- vim.keymap.set('n', '<localleader>ms',  ':w<CR>:! pandoc % -t beamer -o %:r.pdf <CR>', opts) -- Make slide show'
-- vim.keymap.set('n', '<localleader>mv',  ':w<CR>:! mupdf %:r.pdf & <CR>', opts)
-- vim.keymap.set('n', '<localleader>md',  ':w<CR>:! rm %:r.pdf <CR>', opts)

vim.keymap.set('n', '<localleader>mm',  ':MarkdownPreviewToggle<CR>', opts)
vim.keymap.set('n', '<localleader>ms',  ':w<CR>:! pandoc % -t beamer -o %:r.pdf <CR>', opts) -- Make slide show'
vim.keymap.set('n', '<localleader>mv',  ':MarkdownPreview<CR>', opts)
vim.keymap.set('n', '<localleader>md',  ':w<CR>:! rm %:r.pdf <CR>', opts)


-- MarkdownPreview in new window
vim.cmd[[
function OpenMarkdownPreview (url)
  execute "silent ! qutebrowser --target window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]]
