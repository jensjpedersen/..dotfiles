
--vim.api.nvim_create_user_command('ScimInsert', function (var)
--        local output = io.popen('sc-im ' .. var.args .. ' --quit_afterload --nocurses --export_mkd')
--        local output = output:read('*a')

--        local tbl = {}
--        for line in string.gmatch(output, "(.-)\n") do
--            table.insert(tbl, line)
--        end

--        local rel_pos = 0
--        local buffer = vim.api.nvim_get_current_buf()
--        local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
--        vim.api.nvim_buf_set_lines(buffer, r+rel_pos, r+rel_pos, false, tbl)
--    end
--, { nargs = 1 })

--vim.api.nvim_create_user_command('Scim', function (var)
--    local buf = vim.api.nvim_create_buf(true, true) -- create new emtpy buffer
--    --
--    local width = vim.api.nvim_get_option("columns")
--    local height = vim.api.nvim_get_option("lines")
--    local win_height = height
--    local win_width = width
--    local row = 0
--    local col = 0

--    -- set some options
--    local opts = {
--        style = "minimal",
--        relative = "editor",
--        width = win_width,
--        height = win_height,
--        row = row,
--        col = col,
--    }

--    -- Open terminal and execute command 
--    local win = vim.api.nvim_open_win(buf, true, opts)
--    vim.cmd('terminal sc-im '.. var.args)
--    vim.api.nvim_win_close(win, true)
--    vim.cmd('buffer ' .. buf)
--end
--, {nargs = '*'})


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
