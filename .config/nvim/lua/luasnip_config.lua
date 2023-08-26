

-- local ls = require("luasnip")
-- local s = ls.snippet
-- local t = ls.text_node
-- local c = ls.choice_node
-- local i = ls.insert_node

local snippets_folder = vim.fn.stdpath "config" .. "/lua/snippets/"
require("luasnip.loaders.from_lua").lazy_load{ paths = snippets_folder }
vim.cmd [[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]



