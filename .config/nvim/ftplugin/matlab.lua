vim.cmd('set filetype=matlab')

-- Enalbe omnifunc
vim.cmd([[
if &omnifunc == ""
    setlocal omnifunc=syntaxcomplete#Complete 
endif
]])

require('cmp').setup.buffer {
    sources = {
        { name = 'cmp_tabnine' },
        { name = 'omni' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'path' },
    }
}

local opts = { noremap=true, silent=true }

-- Vimux settings
vim.keymap.set('n', '<Leader>vp', ':w<CR>:VimuxPromptCommand<CR>', opts)
vim.keymap.set('n', '<Leader>vl', ':w<CR>:VimuxRunLastCommand<CR>', opts)
vim.keymap.set('n', '<Leader>vi', ':VimuxInspectRunner<CR>', opts)
vim.keymap.set('n', '<Leader>vk', ':VimuxInterruptRunner<CR>', opts)
vim.keymap.set('n', '<Leader>vz', ':VimuxZoomRunner<CR>', opts)
vim.keymap.set('n', '<leader>vj', ":w<CR>:VimuxRunCommand('run ' . bufname('%'))<CR>, opts", opts)

vim.keymap.set('n', '<leader>vc', ":w<CR>:VimuxRunCommand('clc')<CR>:VimuxRunCommand('clear all')<CR>", opts)
vim.keymap.set('n', '<leader>vw', ":w<CR>:VimuxRunCommand('workspace')<CR>", opts)
vim.keymap.set('n', '<leader>vd', [[:norm "xyiw<CR>]] .. ":VimuxRunCommand('doc <C-R>x')<CR>", opts)

-- vim.keymap.set('n', '<leader>ds', ':w<CR>:call jobstart("tmux send -t left dbquit Enter")<CR>', opts)
-- Debugging
vim.keymap.set('n', '<leader>ds', ":call jobstart('tmux send -t left dbquit Enter')<CR>", opts)
vim.keymap.set('n', '<leader>dn', ":call jobstart('tmux send -t left dbcont Enter')<CR>", opts)
vim.keymap.set('n', '<leader>dc', [[:call jobstart("tmux send -t left 'dbclear all' Enter")<CR>]], opts)
vim.keymap.set('n', '<leader>de', [[:call jobstart("tmux send -t left 'dbstop if error' Enter")<CR>]], opts)
vim.keymap.set('n', '<leader>dj', ':lua CheckCode()<CR>', opts) -- :cgetexpr system("cat vim_checkcode_output")]], opts)


-- go to first instance of word  
vim.keymap.set('n', 'gd', ':norm *<CR> :vimgrep /<c-r>//g %<CR>', opts)
vim.keymap.set('n', 'gD', ':norm *<CR> :vimgrep /<c-r>//g **/*.m<CR>', opts)

function CheckCodeQF()
    local file = '~/Sync/FAM/Master/Masteroppgave/Matlab/Master_git/vim_checkcode_output'
    local handle = io.popen('stat -c %Z ' .. file)
    local stat = handle:read('*a')
    local stat_prev = stat
    while stat_prev == stat do
        stat_prev = stat
        local handle = io.popen('stat -c %Z ' .. file)
        stat = handle:read('*a')
        handle:close()
        os.execute('sleep 0.001')
    end
    vim.cmd("cgetexpr system('cat vim_checkcode_output')")
end

function CheckCode()
    vim.cmd[[
    call jobstart("tmux send -t left 'vim_checkcode(\"" . bufname('%'). "\")' Enter") 
    lua CheckCodeQF()
    ]]
end

-- function CheckCode()
--     vim.cmd[[
--     function! CheckCodeQF(jobId, exitCode, event)
--         cgetexpr system('cat vim_checkcode_output') 
--     endfunction
-- 
--     call jobstart("tmux send -t left 'vim_checkcode(\"" . bufname('%'). "\")' Enter", {'on_exit':'CheckCodeQF'}) 
--     ]]
-- end

-- vim.cmd([[autocmd BufEnter *.m compiler mlint]])


-- vim.loop.spawn

