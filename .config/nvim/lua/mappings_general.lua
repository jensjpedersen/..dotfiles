
-- local opts = { noremap=true, silent=false, buffer=0 }
local opts = { noremap=true, silent=true }
local opts2 = { noremap=true, silent=false }


vim.keymap.set('n', '<esc><esc>', ':noh<CR><esc>', opts)
vim.keymap.set('n', '<localleader><localleader>c', ':source $MYVIMRC<CR>', opts)
vim.keymap.set('n', '<leader>/',  ':vimgrep<space>', { noremap=true, silent=false })
-- vim.keymap.set('n', '<leader>e',  ':e! %<CR> :redraw!<CR>' , opts) -- Reload file

-- Toggle options
vim.keymap.set('n', '<localleader><localleader>s', ':set spell! spelllang=en,nb<CR>', opts)
vim.keymap.set('n', '<localleader><localleader>h', ':set cursorline!<CR>', opts)
vim.keymap.set('n', '<localleader><localleader>v', ':execute "set colorcolumn="  . (&colorcolumn == "" ? "80" : "")<CR>', opts)

-- Realod file
vim.keymap.set('n', '<localleader><localleader>e', ':e %<CR>', opts)

-- Set foldmethod
vim.keymap.set('n', 'zm', ':setlocal foldmethod=marker<CR>', opts)

-- Run bash commands
vim.keymap.set('n', 'Q', ':.!bash<CR>', opts)
vim.keymap.set('v', 'Q', ":'<,'>!bash<CR>", opts)
vim.keymap.set('n', '<leader>x', ':w<CR>:!bash % <CR>', opts)
-- vim.keymap.set('c', 'ww', 'w !sudo tee % <CR>', opts)
--

-- Exec rempas
vim.keymap.set('c', 'vs', 'vs | wincmd l | set winfixwidth')
-- Splits
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<C-W>1', ':vertical resize 30<CR>', opts)
vim.keymap.set('n', '<C-W>2', ':vertical resize 40<CR>', opts)
vim.keymap.set('n', '<C-W>3', ':vertical resize 50<CR>', opts)
vim.keymap.set('n', '<C-W>4', ':vertical resize 60<CR>', opts)
vim.keymap.set('n', '<C-W>4', ':vertical resize 70<CR>', opts)
vim.keymap.set('n', '<C-W>5', ':vertical resize 80<CR>', opts)
vim.keymap.set('n', '<C-W>6', ':vertical resize 90<CR>', opts)
vim.keymap.set('n', '<C-W>7', ':vertical resize 100<CR>', opts)
vim.keymap.set('n', '<C-W>8', ':vertical resize 110<CR>', opts)
vim.keymap.set('n', '<C-W>9', ':vertical resize 120<CR>', opts)

-- Bracets navigation
vim.keymap.set('i', '(', '()<Esc>:let leavechar=")"<CR>i', opts)
vim.keymap.set('i', '[', '[]<Esc>:let leavechar="]"<CR>i', opts)
vim.keymap.set('i', '{', '{}<Esc>:let leavechar="}"<CR>i', opts)
vim.keymap.set('i', '<C-j>', '<Esc>:exec "normal f" . leavechar<CR>a', opts)

-- Automatic correct spelling
vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', opts)

-- Terminal
vim.keymap.set('n', '<C-s>', ':buffer term://*<CR>', opts)
vim.keymap.set('t', '<C-s>', [[<C-\><C-n>]] .. ':e #<CR>', { noremap = true, silent = true })

-- Better mappings --
-- keeping it centered
vim.keymap.set('n', 'n', 'nzz', opts)
vim.keymap.set('n', 'N', 'Nzz', opts)
vim.keymap.set('n', '[[', '[[zz', opts)
vim.keymap.set('n', ']]', ']]zz', opts)
vim.keymap.set('n', '<C-I>', '<C-I>zz', opts)
vim.keymap.set('n', '<C-O>', '<C-O>zz', opts)
vim.keymap.set('n', 'J', 'mxJ`x', opts)

-- Keep visual mode after indent 
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)

-- set undo breakpoints for , and . 
vim.keymap.set('i', ',', ',<C-g>u', opts)
vim.keymap.set('i', '.', '.<C-g>u', opts)

-- set jumplist mark if momvent bigger than 5 (coutn) lines
-- -- nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- -- nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
-- move text
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Grep search
vim.keymap.set('n', '<leader>ss', ':silent grep! ', opts2)

-- Quick fix list
vim.cmd([[
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <leader>c :call ToggleQuickFix()<CR>
]])
vim.keymap.set('n', '<C-n>', ':cn<CR>', opts)
vim.keymap.set('n', '<C-p>', ':cp<CR>', opts)


-- Location list
vim.cmd([[
function! ToggleLocationList()
    if empty(filter(getwininfo(), 'v:val.loclist'))
        lua vim.diagnostic.setloclist() 
    else
        lclose
    endif
endfunction
nnoremap <leader>q :call ToggleLocationList()<CR>
]])

-- fucks up quickfix list ENTER ? 
-- vim.keymap.set('n', '<C-m>', ':lnext<CR>', opts)
-- vim.keymap.set('n', '<C-å>', ':lprevious<CR>', opts) 
