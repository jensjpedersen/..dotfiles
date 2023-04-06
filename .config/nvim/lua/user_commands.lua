

-- Create tmux session
vim.api.nvim_create_user_command(
    'Tmux',
    function()
        local path = os.getenv('HOME') .. '/last_session.vim'
        vim.cmd(':mksession! ' .. path)
        os.execute('tmux new-session \\; splitw -h nvim -S ' .. path)
        vim.cmd(':q')
    end,
    { nargs = 0 }
)


-- Nabla diable/enable virt
vim.api.nvim_create_user_command( 'NablaDisable', function() require"nabla".disable_virt() end, { nargs = 0 })
vim.api.nvim_create_user_command( 'NablaEnable', function() require"nabla".enable_virt() end, { nargs = 0 })
