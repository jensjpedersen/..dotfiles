

local opts = { noremap=true, silent=true }
-- Colorscheme 
vim.cmd('colorscheme gruvbox')

-- Lualine
require('lualine').setup({
    options = {
        theme = 'powerline'
    }
})

-- Ultisnips
vim.cmd[[
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
]]

vim.keymap.set('n', '<leader>z',  ':MaximizerToggle<CR>', opts)

-- Emmet
vim.cmd('let g:user_emmet_leader_key="<C-c>"')

-- Notes --
vim.keymap.set('n', '<localleader>ns',  ':!bash ~/Scripts/Vim/screencapture.sh <CR>', opts)

-- QR-code" Make slide show'
vim.keymap.set('n', '<localleader>nq',  ':w<CR>:! qrencode -r % -o %:r.png<CR>', opts)
vim.keymap.set('n', '<localleader>nv',  ':!sxiv %:r.png<CR>', opts)
vim.keymap.set('n', '<localleader>nd',  ':!rm %:r.png<CR>', opts)

-- Markdown
vim.keymap.set('n', '<localleader>mm',  ':w<CR>:! pandoc % -t latex -o %:r.pdf <CR>', opts)
vim.keymap.set('n', '<localleader>ms',  ':w<CR>:! pandoc % -t beamer -o %:r.pdf <CR>', opts) -- Make slide show'
vim.keymap.set('n', '<localleader>mv',  ':w<CR>: RunSilent mupdf %:r.pdf & <CR>', opts)
vim.keymap.set('n', '<localleader>md',  ':w<CR>: RunSilent rm %:r.pdf <CR>', opts)

-- Indent guides
vim.keymap.set('n', '<Leader>i',  '<Plug>IndentGuidesToggle', opts)

-- Table mode 
vim.keymap.set('n', '<localleader><localleader>t', ':TableModeToggle<CR>', opts)
vim.keymap.set('n', '<leader>tl', '<Plug>(table-mode-motion-right)', opts)
vim.keymap.set('n', '<leader>th', '<Plug>(table-mode-motion-left)', opts)
vim.keymap.set('n', '<leader>tj', '<Plug>(table-mode-motion-down)', opts)
vim.keymap.set('n', '<leader>tk', '<Plug>(table-mode-motion-up)', opts)


-- Tagbar
vim.keymap.set('n', '<leader>l',   ':TagbarToggle<CR>', opts)
vim.cmd([[
let g:tagbar_width = 50
let g:tagbar_position = 'topleft vertical' 
]])


-- Undotree 
vim.cmd[[
let g:undotree_CustomUndotreeCmd  = 'topleft vertical 50 new'
let g:undotree_CustomDiffpanelCmd = 'botright 10 new'
]]
vim.keymap.set('n', '<leader>u',  ':UndotreeToggle<CR>', opts)


-- Startify 
vim.cmd([[
" Vim startify
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.lua'}, 
                           \ {'w': '~/vimwiki/index.md'}, 
                           \ {'p': '~/vimwiki2/index.md'}, 
                           \ {'m': '~/Sync/FAM/Master/Masteroppgave/Notes/index.md'} ]

let g:startify_commands = [ {'d' : 'VimwikiMakeDiaryNote 2'},
                          \ {'n' : 'VimwikiMakeDiaryNote'} ]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          "\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_files_number = 10 
let g:startify_change_to_dir = 0 " autochdir is enabled, not needed
let g:startify_custom_header = 'startify#pad(startify#fortune#cowsay())'
]])


-- Nvim tree
require("nvim-tree").setup()
vim.keymap.set('n', '<leader>o',  ':NvimTreeFindFileToggle<CR>', opts)


-- Ranger
vim.api.nvim_command('autocmd BufEnter,TermOpen term://*ranger* set nonumber norelativenumber signcolumn=no')
vim.api.nvim_command('autocmd BufLeave,TermClose term://*ranger* set number relativenumber signcolumn=yes')

function Yank()
    -- vim.cmd('set modifiable')
    --os.execute('sleep 5')

    -- vim.cmd([[<C-\><C-n>]])

    -- os.execute('cat ranger_pipe')
    local handle = io.popen('cat /home/jensjp/ranger_pipe')
    -- print(handle:read("*a"))

    -- vim.cmd([[
    -- exec "terminal ranger --choosefile=/tmp/vim_ranger_current_file"
    -- if filereadable('/tmp/vim_ranger_current_file')
    --     let file = system('cat /tmp/vim_ranger_current_file')
    --     echomsg "hei"
    --     call system('rm /tmp/vim_ranger_current_file')
    -- endif
    -- redraw!
    -- ]])
    -- need two lines
    -- vim.cmd('insert :yank')
    -- os.execute('sleep 0.001')
    -- vim.cmd('p')
end
vim.keymap.set('n', '<leader>y', ':lua Yank()<CR>')

function Ranger()
    -- run ranger 
    vim.cmd([[terminal ranger]])

    print("hei")
    -- local var = vim.nvim_cmd('terminal ranger', opts=true)
    -- print(var)
    vim.keymap.set('t', 'q',  [[<C-\><C-n> :bdelete! <CR>]], { noremap=true, silent=true, buffer=0 })
    vim.keymap.set('t', 'O', [[<C-\><C-n>]] .. 'gg0f/"zyE :bdelete!<CR> :e <C-r>z<CR>', { noremap=true, silent=true, buffer=0})
    --vim.keymap.set('t', 'Y', '<cmd> lua Yank()<CR>', { noremap=true , buffer=0 })
    vim.keymap.set('t', 'Y', 'jj' .. [[<C-\><C-n>]] .. ':sleep 1', { noremap=true , buffer=0 })
end
vim.keymap.set('n', '<leader>f', ':lua Ranger()<CR>')


