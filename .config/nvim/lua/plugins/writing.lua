
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


-- LanguageTool
--:let g:languagetool_server=
-- vim.o.languagetool_server = '/home/jensjp/Repos/LanguageTool-5.7-stable/languagetool-server.jar'
--
vim.cmd('autocmd User LanguageToolCheckDone LanguageToolSummary')

-- vim.cmd("let g:languagetool_server='/home/jensjp/Repos/LanguageTool-5.7-stable/languagetool-server.jar'")
-- vim.cmd([[
--     g:languagetool = {
--         '.' : {
--             {model1} for all filetypes
--         },
--         'my_filetype' : {
--             {model1} for my_filetype
--         }
--     }
-- 
--     {model1} = {
--         'enabledRules' : "list,of,enabled,rules",
--         'disabledRules' : "list,of,disabled,rules",
--         'enabledCategories' : "list,of,enabled,categories",
--         'disabledCategories' : "list,of,disabled,categories",
--         'language' : "the code of the language to check,
--             as given by :LanguageToolSupportedLanguages"
--     }
-- ]])
-- TODO
