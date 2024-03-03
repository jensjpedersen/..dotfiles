-- diagnostic mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setqflist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>w', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<localleader><localleader>f', vim.lsp.buf.format, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}



-- Servers
require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "python", "pyrex" }
}

-- Install: npm install -g typescript typescript-language-server
require('lspconfig')['tsserver'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...

    settings = {
        ["rust-analyzer"] = {}
    }
}


-- install lsp from aur: lua-language-server.git
require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


-- Install servers with mason
require("mason").setup()

-- install bash language sever: npm i -g bash-language-server
require 'lspconfig'.bashls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "sh", "zsh" }
}


-- R setup
require 'lspconfig'.r_language_server.setup {
    on_attach = on_attach,
    flags = lsp_flags
}

-- Webdev setup
-- require 'lspconfig'.emmet_ls.setup {
--     on_attach = on_attach,
--     flags = lsp_flags
-- }

-- html, css, jsonls and javascript server installed from: 
-- npm i -g vscode-langservers-extracted

--[[
Neovim does not currently include built-in snippets. vscode-css-language-server only provides completions when snippet support is enabled. To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.
--]]


-- Install: npm i -g vscode-langservers-extracted
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- eslint provides command; EslintFixAll: Fix all eslint problems for this buffer
require'lspconfig'.eslint.setup{
  capabilities = capabilities,
}
require'lspconfig'.html.setup{
  capabilities = capabilities,
}
require'lspconfig'.jsonls.setup{
    capabilities = capabilities,
}
require'lspconfig'.cssls.setup{
  capabilities = capabilities,
}

-- require'lspconfig'.tailwindcss.setup{
--   capabilities = capabilities,
-- }

-- Ltex setup
require 'lspconfig'.ltex.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "bib", "gitcommit", "org", "plaintex", "rst", "rnoweb", "tex" }
}

-- require'lspconfig'.texlab.setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }

require 'lspconfig'.julials.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}


require'lspconfig'.grammarly.setup{
    filetypes = { "tex" },
}


require'lspconfig'.clangd.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require'lspconfig'.arduino_language_server.setup {
    cmd = {
        "arduino-language-server",
        "-cli-config", "/home/jensjp/.arduino15/arduino-cli.yaml",
        "-fqbn", "arduino:avr:mega",
        "-cli", "/home/jensjp/.local/bin/arduino-cli",
        "-clangd", "/usr/bin/clangd"
    }
}

require'lspconfig'.sqls.setup{}
-- require('lspconfig').sqls.setup{
--     on_attach = function(client, bufnr)
--         require('sqls').on_attach(client, bufnr)

--     end
-- }

-- require'lspconfig'.sqls.setup{
--   settings = {
--     sqls = {
--       connections = {
--         {
--           driver = 'mysql',
--           dataSourceName = 'sql11678836:sql11678836@tcp(sql11.freesqldatabase.com:3306)/sql11678836',
--         },
--       },
--     },
--   },
-- }


require'lspconfig'.phpactor.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
