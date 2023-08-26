
vim.o.completeopt="menu,menuone,noselect"

local lspkind = require('lspkind')
local source_mapping = {
	buffer = "[Buffer]",
    omni = "[Omni]",
    luasnip = "[Snippet]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

-- Setup nvim-cmp.
local cmp = require'cmp'
local ls = require('luasnip')
cmp.setup({
    -- completion = {autocomplete = true}, 
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        -- Luasnip mappings - Place here to not interfere with normal tab.  
        ['<Tab>'] = cmp.mapping(function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { "i", "s" }),
        ['<C-k>'] = cmp.mapping(function()
        	if ls.choice_active() then
        		ls.change_choice(1)
        	end
        end, {"i", "s"}), 



-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'cmp_tabnine' },
        { name = 'luasnip' },
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
    }),
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == 'cmp_tabnine' then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. ' ' .. menu
				end
				vim_item.kind = ''
			end
			vim_item.menu = menu
			return vim_item
		end
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})



-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local capabilities = require('cmp_nvim_lsp').default(vim.lsp.protocol.make_client_capabilities())
-- cmp_nvim_lsp.update_capabilities is deprecated, use cmp_nvim_lsp.default
-- _capabilities


-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--    capabilities = capabilities
--  }

