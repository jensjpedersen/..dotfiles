
-- local opts = { noremap=true, silent=false, buffer=0 }
local opts = { noremap=true, silent=false }

vim.keymap.set('n', '<leader>p', '<cmd>Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>r', '<cmd>Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader>g', '<cmd>Telescope current_buffer_fuzzy_find<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>', opts)
vim.keymap.set('n', '<leader>h', '<cmd>Telescope oldfiles<CR>', opts)
vim.keymap.set('n', '<localleader>f', '<cmd>Telescope git_files<CR>', opts)

local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
})
