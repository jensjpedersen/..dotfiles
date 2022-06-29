
local opts = { noremap=true, silent=false }

-- biber
vim.keymap.set('n', '<localleader>lb',  ':! biber %:r <CR>', opts)


-- vimtex 
vim.cmd([[
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
]])
