

-- DiagnosticUnderlineError xxx cterm=underline gui=underline guisp=Red
-- DiagnosticUnderlineWarn xxx cterm=underline gui=underline guisp=Orange
-- DiagnosticUnderlineInfo xxx cterm=underline gui=underline guisp=LightBlue
-- DiagnosticUnderlineHint xxx cterm=underline gui=underline guisp=LightGrey
--
-- vim.cmd('highlight DiagnosticUnderlineHint guisp=LightBlue')
--
--
--
--
--
-- Change coceal color from gray, markdown, latex
vim.cmd[[
hi Conceal ctermfg=Green
]]

-- NvimTree background
vim.cmd[[hi NvimTreeNormal ctermbg=0]]
