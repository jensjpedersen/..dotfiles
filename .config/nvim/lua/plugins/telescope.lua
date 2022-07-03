
-- local opts = { noremap=true, silent=false, buffer=0 }
local opts = { noremap=true, silent=false }


vim.keymap.set('n', '<leader>p', '<cmd>Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>r', '<cmd>Telescope grep_string<CR>', opts)
-- vim.keymap.set('n', '<leader>r', '<cmd>Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader>g', '<cmd>Telescope current_buffer_fuzzy_find<CR>', opts)
vim.keymap.set('n', '<leader>b', "<cmd> lua require('telescope.builtin').buffers({sort_mru=true, ignore_current_buffer=true})<CR>", opts)
vim.keymap.set('n', '<leader>h', '<cmd>Telescope oldfiles<CR>', opts)
vim.keymap.set('n', '<localleader>f', '<cmd>Telescope git_files<CR>', opts)
vim.keymap.set('n', '<leader>m', '<cmd>Telescope marks<CR>', opts)

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

-- preview-up
-- preview-down
-- preview-page-up
-- preview-page-down

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
-- require('telescope').setup {
--   extensions = {
--     fzf = {
--       fuzzy = true,                    -- false will only do exact matching
--       override_generic_sorter = true,  -- override the generic sorter
--       override_file_sorter = true,     -- override the file sorter
--       case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--                                        -- the default case_mode is "smart_case"
--     }
--   }
-- }
