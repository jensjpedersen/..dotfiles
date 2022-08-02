local opts1 = { noremap=true, silent=true }
local opts2 = { noremap=false, silent=true}

-- Vim sneak mappings
-- normal modek
vim.keymap.set('n', 'ø', '<Plug>Sneak_s', opts2)
vim.keymap.set('n', 'Ø', '<Plug>Sneak_S', opts2)

-- visual-mode
vim.keymap.set('v', 'ø', '<Plug>Sneak_s', opts2)
vim.keymap.set('n', 'Ø', '<Plug>Sneak_S', opts2)

-- operator-pending-mode
vim.keymap.set('x', 'ø', '<Plug>Sneak_s', opts2)
vim.keymap.set('x', 'Ø', '<Plug>Sneak_S', opts2)


-- Vim sneak settings
vim.cmd[[
let g:sneak#use_ic_scs = 1 " case insensitive
highlight link Sneak None
]]


