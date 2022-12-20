

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

-- Vista
-- vim.keymap.set('n', '<leader>l', '<cmd>Vista!!<CR>', opts)

-- vim.cmd[[
-- let g:vista_cursor_delay = 0
-- let g:vista_blink = [0, 0]
-- let g:vista_sidebar_position = 'vertical topleft'
-- let g:vista_sidebar_width = 40

-- let g:vista_executive_for = {
--   \ 'vimwiki': 'markdown',
--   \ 'pandoc': 'markdown',
--   \ 'markdown': 'toc',
--   \ }
-- ]]


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
                           \ {'m': '~/Sync/FAM/Master/Masteroppgave/Notes/index.md'}, 
                           \ {'s': '~/Sync/FAM/Master/FYS-STK4155-AnvendtDataanalyseOgMaskinlæring/Notes/index.md'} ]

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
-- nvim-tree.view.preserve_window_proportions
vim.keymap.set('n', '<leader>o',  ':NvimTreeFindFileToggle<CR>', opts)

-- Ranger
vim.keymap.set('n', '<leader>f', '<cmd>lua require("ranger_nvim").ranger_nvim()<CR>')

-- OpenAI
vim.keymap.set('n', '<leader>a', '<cmd> lua require("nvim_openai").send_current_line()<CR>', opts)


-- Vim signature
vim.keymap.set('n', '[<leader>', ':<C-U>call signature#mark#Goto("prev", "line", "pos")<CR>', opts)
vim.keymap.set('n', ']<leader>', ':<C-U>call signature#mark#Goto("next", "line", "pos")<CR>', opts)
vim.keymap.set('n', '[8', ':<C-U>call signature#marker#Goto("prev", "same", v:count)<CR>', opts)
vim.keymap.set('n', ']9', ':<C-U>call signature#marker#Goto("next", "same", v:count)<CR>', opts)


-- Database | DadbodUI
-- vim.cmd[[
-- nnoremap <silent> <leader>du :DBUIToggle<CR>
-- nnoremap <silent> <leader>df :DBUIFindBuffer<CR>
-- nnoremap <silent> <leader>dr :DBUIRenameBuffer<CR>
-- nnoremap <silent> <leader>dl :DBUILastQueryInfo<CR>
-- let g:db_ui_save_location = '~/.config/db_ui'
-- ]]


