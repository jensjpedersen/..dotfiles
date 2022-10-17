vim.cmd[[autocmd FileType html setlocal commentstring=<!--\ %s\ -->]]


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

