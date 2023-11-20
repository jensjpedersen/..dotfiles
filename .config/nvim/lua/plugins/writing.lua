
local opts = { noremap=true, silent=false }
local opts2 = { noremap=true, silent=true }

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

-- Add .md extension to markdown links
vim.cmd("let g:vimwiki_markdown_link_ext = 1")

-- vim.cmd[[
-- let g:vimwiki_key_mappings =
-- \ {
-- \   'all_maps': 1,
-- \   'global': 1,
-- \   'headers': 1,
-- \   'text_objs': 1,
-- \   'table_format': 0,
-- \   'table_mappings': 0,
-- \   'lists': 1, 
-- \   'links': 1,
-- \   'html': 0,
-- \   'mouse': 0,
-- \ }
-- ]]


-- vim.cmd[[
-- let g:vimwiki_table_mappings=0
-- let g:vimwiki_table_auto_fmt=0
-- ]]


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

-- vim.cmd([[let g:vimwiki_filetypes = ['markdown', 'latex', 'tex'] ]])


-- Markdown
-- vim.keymap.set('n', '<localleader>ms',  ':w<CR>:! pandoc % -t beamer -o %:r.pdf <CR>', opts) -- Make slide show'
-- vim.keymap.set('n', '<localleader>md',  ':w<CR>:! rm %:r.pdf <CR>', opts)

-- Markdown bindings
vim.keymap.set('n', '<localleader>mc',  ':w<CR>:! pandoc % -t latex -o %:r.pdf <CR>', opts)
vim.keymap.set('n', '<localleader>mm',  ':MarkdownPreviewToggle<CR>', opts)
vim.keymap.set('n', '<localleader>ms',  ':w<CR>:! pandoc % -t beamer -o %:r.pdf <CR>', opts) -- Make slide show'
-- vim.keymap.set('n', '<localleader>mv',  ':MarkdownPreview<CR>', opts)
vim.keymap.set('n', '<localleader>mv',  ':w<CR>:! mupdf %:r.pdf & <CR>', opts)
vim.keymap.set('n', '<localleader>md',  ':w<CR>:! rm %:r.pdf <CR>', opts)


-- MarkdownPreview in new window
vim.cmd[[
function OpenMarkdownPreview (url)
  execute "silent ! qutebrowser --target window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]]


-- vim.cmd("let g:wiki_root = '~/wiki/wiki1'")
-- vim.cmd("let g:wiki_ft_wiki = [{'path': '~/wiki/wiki1'}, {'path': '~/wiki/wiki2'}]")

-- Wiki settings
-- vim.cmd[[
--     function! WikiRoot()
--       let l:local = finddir('wiki', ';./')
--       return !empty(l:local) ? l:local : '~/wiki'
--     endfunction

--     let g:wiki_root = 'WikiRoot'
-- ]]

-- vim.cmd[[
-- let g:wiki_filetypes = ['md', 'tex']
-- let g:wiki_link_extension = '.md'
-- let g:wiki_link_target_type = 'md'
-- ]]

-- -- Wiki mappings
-- vim.keymap.set('n', '<Tab>', '<Plug>(wiki-link-next)', opts2)
-- vim.keymap.set('n', '<S-Tab>', '<Plug>(wiki-link-prev)', opts2)




