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



-- Harpoon
-- require("telescope").load_extension('harpoon')
vim.keymap.set('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', opts1)
vim.keymap.set('n', '<leader>s', ':Telescope harpoon marks<CR>', opts1)
vim.keymap.set('n', '<leader>s', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts1)
vim.keymap.set('n', [['t]], ':lua require("harpoon.ui").nav_file(1)<CR>', opts1)
vim.keymap.set('n', [['r]], ':lua require("harpoon.ui").nav_file(2)<CR>', opts1)
vim.keymap.set('n', [['e]], ':lua require("harpoon.ui").nav_file(3)<CR>', opts1)
vim.keymap.set('n', [['w]], ':lua require("harpoon.ui").nav_file(4)<CR>', opts1)
vim.keymap.set('n', [['q]], ':lua require("harpoon.ui").nav_file(5)<CR>', opts1)
vim.keymap.set('n', 'mt', ':lua require("harpoon.mark").add_file(1)<CR>', opts1)
