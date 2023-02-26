local opts = { noremap=true, silent=true }
-- Git mappings 

-- Git fugitive mappings
vim.keymap.set('n', '<localleader>b', ':Git branch<CR>', opts)
vim.keymap.set('n', '<localleader>B', ':Git blame<CR>', opts)
vim.keymap.set('n', '<localleader>g', ':Git<CR>', opts)
vim.keymap.set('n', '<localleader>i', ':Git status<CR>', opts)
vim.keymap.set('n', '<localleader>p', ':Git push<CR>', opts)
vim.keymap.set('n', '<localleader>P', ':Git pull<CR>', opts)
vim.keymap.set('n', '<localleader>c', ':Git commit<CR>', opts)
vim.keymap.set('n', '<localleader>a', ':Git add %<CR>', opts)
vim.keymap.set('n', '<localleader>A', ':Git reset %<CR>', opts)
vim.keymap.set('n', '<localleader>u', ':Git add -u<CR>', opts)
vim.keymap.set('n', '<localleader>h', ':Git log<CR>', opts)
-- vim.keymap.set('n', '<localleader>L', ':0Gclog!<CR>', opts)
vim.keymap.set('n', '<localleader>L', ':DiffviewFileHistory %<CR>', opts)
vim.keymap.set('v', '<localleader>L', ':Gclog!<CR>', opts)
-- vim.keymap.set('v', '<localleader>L', ':DiffviewFileHistory<CR>', opts)
-- vim.keymap.set('n', '<localleader>H', ':Git log -p %<CR>', opts)
vim.keymap.set('n', '<localleader>H', ':DiffviewFileHistory<CR>', opts)
vim.keymap.set('n', '<localleader>r', ':Git reflog<CR>', opts)
vim.keymap.set('n', '<localleader>q', function ()
        local buf_nr = vim.fn.bufnr("fugitive://*")
        if vim.api.nvim_buf_is_loaded(buf_nr) then
            vim.cmd("bdelete " .. buf_nr)
            return
        end
        vim.cmd("DiffviewClose")
end, opts)
-- vim.keymap.set('n', '<localleader>q', ':bdelete fugitive:*<C-a><CR>', opts)



-- Vimdiff
vim.keymap.set('n', '<localleader>v', ':Gdiffsplit!<CR>', opts)
vim.keymap.set('v', '<localleader>v', ':diffput<CR>', opts)
vim.keymap.set('v', '<localleader>l', ':Linediff<CR>', opts)

vim.keymap.set('n', '<leader>dt', ':diffthis<CR>', opts)
vim.keymap.set('n', '<leader>do', ':diffoff<CR>', opts)

-- Git signs
require('gitsigns').setup{
    attach_to_untracked = true,
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', 'gn', function()
            if vim.wo.diff then return ']czz' end
            vim.schedule(function() gs.next_hunk(); vim.cmd(':normal zz') end)
            return '<Ignore>'
        end, {expr=true})

        map('n', 'gp', function()
            if vim.wo.diff then return '[czz' end
            vim.schedule(function() gs.prev_hunk(); vim.cmd('normal zz') end)
            return '<Ignore>'
        end, {expr=true})

        -- Actions
        map({'n', 'v'}, '<localleader>s', ':Gitsigns stage_hunk<CR>')
        map({'n', 'v'}, '<localleader>S', ':Gitsigns reset_hunk<CR>')
        -- map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<localleader>u', gs.undo_stage_hunk)
        -- map('n', '<leader>hR', gs.reset_buffer)
        -- map('n', '<leader>hp', gs.preview_hunk)
        -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        -- map('n', '<leader>tb', gs.toggle_current_line_blame)
        -- map('n', '<leader>hd', gs.diffthis)
        -- map('n', '<leader>hD', function() gs.diffthis('~') end)
        -- map('n', '<leader>td', gs.toggle_deleted)
        map('n', '<localleader>D', gs.setqflist)
        map('n', '<localleader>d', function() gs.setqflist('all') end)

        -- Text object
        -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        --
    end
}

-- Tig
vim.api.nvim_command('autocmd BufEnter,TermOpen term://*tig* set nonumber norelativenumber signcolumn=no')
vim.api.nvim_command('autocmd BufLeave,TermClose term://*tig* set number relativenumber signcolumn=yes')
function Tig()
    vim.cmd('terminal tig')
    vim.keymap.set('t', 'q',  [[<C-\><C-n>]] .. ':bdelete! <CR>', { noremap=true, silent=true, buffer=0 })
end
vim.keymap.set('n', '<localleader>t', ':lua Tig()<CR>')



