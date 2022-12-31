
-- local opts = { noremap=true, silent=false, buffer=0 }
local opts = { noremap=true, silent=false }

vim.keymap.set('n', '<leader>p', '<cmd>Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>sr', '<cmd>Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader>r', '<cmd>Rg!<CR>', opts)
vim.keymap.set('n', '<leader>g', '<cmd>Telescope current_buffer_fuzzy_find<CR>', opts)
vim.keymap.set('n', '<leader>b', "<cmd> lua require('telescope.builtin').buffers({sort_mru=true, ignore_current_buffer=true})<CR>", opts)
vim.keymap.set('n', '<leader>h', '<cmd>Telescope oldfiles<CR>', opts)
vim.keymap.set('n', '<leader>sh', '<cmd>Telescope help_tags<CR>', opts)
vim.keymap.set('n', '<leader>sc', '<cmd>Telescope commands<CR>', opts)
vim.keymap.set('n', '<leader>sT', '<cmd>Telescope tags<CR>', opts)
vim.keymap.set('n', '<leader>st', '<cmd>Telescope current_buffer_tags<CR>', opts)
vim.keymap.set('n', '<localleader>f', '<cmd>Telescope git_files<CR>', opts)
vim.keymap.set('n', '<leader>sm', '<cmd>Telescope marks<CR>', opts)

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

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

