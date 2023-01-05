
-- local opts = { noremap=true, silent=false, buffer=0 }
local opts = { noremap=true, silent=false }
local opts2 = { noremap=true, silent=true }

vim.keymap.set('n', '<leader>p', '<cmd>Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>sg', '<cmd>Telescope live_grep<CR>', opts)
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



-- Custom run command window
--
--
vim.keymap.set('n', '<leader>sr', function ()
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"
    opts = opts or {}
    local buf = vim.api.nvim_buf_get_name(0)
    pickers.new(opts, {
        prompt_title = "Run Commands",
        finder = finders.new_table {
            results = {
               [[call jobstart("tmux send -t left '%run ]] .. buf ..  [[' Enter")]],
               [[call jobstart("tmux send -t left '%run -i ]] .. buf ..  [[' Enter")]],
               [[call jobstart("tmux send -t left 'python ]] .. buf ..  [[' Enter")]],
               [[DapContinue]]
            }
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
              actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                -- print(selection[1])
                --
                vim.cmd[[call jobstart("tmux send-keys -t left -X cancel")]] -- Cancel tmux mode
                vim.cmd(selection[1])
                vim.g.last_run_command = selection[1]
              end)
              return true
            end,
    }):find()
end, opts2)

-- https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md#guide-to-your-first-picker

vim.keymap.set('n', '<leader>l', '<cmd> execute g:last_run_command <CR>', opts2)




