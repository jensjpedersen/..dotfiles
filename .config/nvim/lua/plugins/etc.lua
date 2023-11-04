

local opts = { noremap=true, silent=true }
-- Colorscheme 
-- vim.cmd('colorscheme gruvbox')
-- vim.cmd('colorscheme tokyonight')
vim.cmd('colorscheme gruvbox-material')
-- vim.cmd('colorscheme gruvbox-baby')

-- Lualine
require('lualine').setup({
    options = {
        theme = 'powerline',
        globalstatus = true,
    }
})


vim.keymap.set('n', '<leader>z',  ':MaximizerToggle<CR>', opts)

-- Emmet
-- vim.cmd('let g:user_emmet_leader_key="<C-c>"')
vim.cmd[[
imap ;; <C-y>,
" nmap ;; <C-y>,
vmap ;; <C-y>,
]]

-- Notes --
-- vim.keymap.set('n', '<localleader>ns',  ':!bash ~/Scripts/Vim/screencapture.sh <CR>', opts)

-- QR-code" Make slide show'
vim.keymap.set('n', '<localleader>nq',  ':w<CR>:! qrencode -r % -o %:r.png<CR>', opts)
vim.keymap.set('n', '<localleader>nv',  ':!sxiv %:r.png<CR>', opts)
vim.keymap.set('n', '<localleader>nd',  ':!rm %:r.png<CR>', opts)


-- Table mode 
vim.cmd([[
let g:table_mode_disable_mappings = 1
let g:table_mode_map_prefix = '<leader>T'
]])

vim.keymap.set('n', '<localleader><localleader>t', ':TableModeToggle<CR>', opts)
-- vim.keymap.set('n', '<leader>tl', '<Plug>(table-mode-motion-right)', opts)
-- vim.keymap.set('n', '<leader>th', '<Plug>(table-mode-motion-left)', opts)
-- vim.keymap.set('n', '<leader>tj', '<Plug>(table-mode-motion-down)', opts)
-- vim.keymap.set('n', '<leader>tk', '<Plug>(table-mode-motion-up)', opts)


-- Tagbar
vim.keymap.set('n', '<leader>t',   ':TagbarToggle<CR>', opts)
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

-- Indent balank lines
require("ibl").setup {
    -- exclude filetype
    exclude = { filetypes = { "startify" } },

    -- for example, context is off by default, use this to turn it on
    -- show_current_context = true,
    -- show_current_context_start = false,
    --

}
-- vim.g.indent_blankline_filetype_exclude = {"lspinfo", "packer", "checkhealth", "help", "man", "", "startify"}
--
vim.cmd('highlight IndentBlanklineContextChar ctermfg=8 cterm=nocombine')

-- Startify 
vim.cmd([[
" Vim startify
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.lua'}, 
                           \ {'w': '~/vimwiki/index.md'}, 
                           \ {'p': '~/vimwiki2/index.md'}, 
                           \ {'a': '~/vimwiki2/Jobb/index.md'}, 
                           \ {'m': '~/vimwiki2/Mål/index.md'},
                           \ ]

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
vim.keymap.set('n', '<leader>y',  ':NvimTreeFindFileToggle<CR>', opts)

-- Ranger
--
require("ranger_nvim").setup({
    fileopener = "rifle",
    mapping = '<leader>f',
})


-- vim.keymap.set('n', '<leader>f', '<cmd>lua require("ranger_nvim").ranger_nvim()<CR>')

-- OpenAI
-- vim.keymap.set('n', '<leader>as', '<cmd> lua require("openai_nvim").send_current_line()<CR>', opts)
-- vim.keymap.set('v', '<leader>as', '<cmd> lua require("openai_nvim").send_visual_selection()<CR>', opts)

-- Scim
require("scim-nvim").setup()

-- Copilot
vim.keymap.set('n', '<leader>ap', '<cmd> Copilot panel<CR>', opts)
vim.keymap.set('n', '<leader>ao', '<cmd> Copilot open<CR>', opts)
vim.cmd[[
imap <silent><script><expr> <C-h> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
]]

-- Codium

-- vim.g.codeium_no_map_tab = true
-- vim.keymap.set('i', '<C-h>', function () return vim.fn['codeium#Accept']() end, { expr = true })



-- Vim signature
vim.keymap.set('n', '[<leader>', ':<C-U>call signature#mark#Goto("prev", "line", "pos")<CR>', opts)
vim.keymap.set('n', ']<leader>', ':<C-U>call signature#mark#Goto("next", "line", "pos")<CR>', opts)
vim.keymap.set('n', '[8', ':<C-U>call signature#marker#Goto("prev", "same", v:count)<CR>', opts)
vim.keymap.set('n', ']9', ':<C-U>call signature#marker#Goto("next", "same", v:count)<CR>', opts)

-- TODO comments
--
-- require("trouble").setup()
require("todo-comments").setup()
vim.keymap.set('n', '<leader>sc', '<cmd>TodoQuickFix<CR>', opts)





-- vim.keymap.set("n", "]t", function()
--   require("todo-comments").jump_next()
-- end, { desc = "Next todo comment" })

-- vim.keymap.set("n", "[t", function()
--   require("todo-comments").jump_prev()
-- end, { desc = "Previous todo comment" })


-- Database | DadbodUI
vim.keymap.set('n', '<leader>du', ':DBUIToggle<CR>', opts)
-- vim.cmd[[
-- nnoremap <silent> <leader>du :DBUIToggle<CR>
-- nnoremap <silent> <leader>df :DBUIFindBuffer<CR>
-- nnoremap <silent> <leader>dr :DBUIRenameBuffer<CR>
-- nnoremap <silent> <leader>dl :DBUILastQueryInfo<CR>
-- let g:db_ui_save_location = '~/.config/db_ui'
-- ]]



