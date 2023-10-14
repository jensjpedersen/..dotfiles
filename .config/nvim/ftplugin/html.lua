local opts = { noremap=true, silent=true }

vim.cmd('autocmd BufRead,BufNewFile *.html set foldmethod=marker')
vim.cmd[[autocmd FileType html setlocal commentstring=<!--\ %s\ -->]]


-- Open file in firefox
-- vim.keymap.set('n', '<localleader>jv', ':!firefox --new-window % & <CR>', opts)

-- Open file in qutebrowser
vim.keymap.set('n', '<localleader>jv', ':!qutebrowser --target window % & <CR>', opts)



-- Toggle browser refresh. Depends on reload_browser.sh
RefreshBrowser = false
vim.keymap.set('n', '<localleader>jl', function ()
    if RefreshBrowser then
        -- Delete au group
        vim.api.nvim_del_augroup_by_name('RefreshBrowser')
        RefreshBrowser = false
    else
        -- Create au group
        local rb_group = vim.api.nvim_create_augroup('RefreshBrowser', { clear = true })
        vim.api.nvim_create_autocmd(
        "BufWritePost *.html",
        { command = ':call jobstart("bash ~/.config/nvim/Scripts/reload_browser.sh")',
          group = rb_group
        })
        RefreshBrowser = true
    end
end)


-- Disable Treesitter indent and context
vim.cmd('TSDisable indent')
vim.cmd('TSContextDisable')



