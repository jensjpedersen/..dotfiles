

local ls = require("luasnip")
-- local s = ls.snippet
-- local t = ls.text_node
-- local c = ls.choice_node
-- local i = ls.insert_node

ls.config.set_config({
    history = false, -- keep around last snippet local to jump back
    enable_autosnippets = true,})

local snippets_folder = vim.fn.stdpath "config" .. "/lua/snippets/"
require("luasnip.loaders.from_lua").lazy_load{ paths = snippets_folder }
vim.cmd [[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]


vim.cmd[[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-K> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-K> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

]]

vim.keymap.set('n', '<localleader><localleader>l', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>')
