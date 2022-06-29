local opts = { noremap=true, silent=false }
-- Git mappings --
-- Git fugitive mappings
vim.keymap.set('n', '<localleader>b', ':Git branch<CR>', opts)
vim.keymap.set('n', '<localleader>B', ':Git branch<Space>', opts)
vim.keymap.set('n', '<localleader>g', ':Git<CR>', opts)
vim.keymap.set('n', '<localleader>i', ':Git status<CR>', opts)
vim.keymap.set('n', '<localleader>s', ':GitGutterStageHunk<CR>', opts)
vim.keymap.set('n', '<localleader>S', ':GitGutterUndoHunk<CR>', opts)
vim.keymap.set('n', '<localleader>p', ':Git push<CR>', opts)
vim.keymap.set('n', '<localleader>P', ':Git pull<CR>', opts)
vim.keymap.set('n', '<localleader>c', ':Git commit<CR>', opts)
vim.keymap.set('n', '<localleader>a', ':Git add %<CR>', opts)
vim.keymap.set('n', '<localleader>A', ':Git reset %<CR>', opts)
vim.keymap.set('n', '<localleader>u', ':Git add -u<CR>', opts)
vim.keymap.set('n', '<localleader>h', ':Git log<CR>', opts)
vim.keymap.set('n', '<localleader>H', ':0Gclog!<CR>', opts)
vim.keymap.set('n', '<localleader>L', ':Git log -p %<CR>', opts)
vim.keymap.set('n', '<localleader>v', ':Gdiffsplit!<CR>', opts)
-- nnoremap <localleader>D :G! difftool<CR>
