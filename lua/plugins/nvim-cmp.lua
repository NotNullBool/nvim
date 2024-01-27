---@diagnostic disable: missing-fields
return{{
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-omni",
		"hrsh7th/cmp-buffer", --source for text in buffer
		"FelipeLema/cmp-async-path", -- source for file system
		"hrsh7th/cmp-cmdline", -- source for cmdline
		"L3MON4D3/LuaSnip", -- snippet engine
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		{ "rafamadriz/friendly-snippets", config = function () require("luasnip.loaders.from_vscode").lazy_load() end}, -- some default snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		-- Set up nvim-cmp.
		local cmp = require('cmp')
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)

		local cmp_mappings = {


			["<C-f>"] = cmp.mapping(function(fallback)
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
				-- they way you will only jump inside the snippet region
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-b>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
			["<C-j>"] = cmp.mapping.select_next_item(),
			-- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
			-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
			['<C-e>'] = cmp.mapping.abort(), -- close completion window
			['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}

		cmp.setup({
			enabled = function()
				return true
				-- local context = require("cmp.config.context")
				--
				-- if vim.api.nvim_get_mode().mode == 'c' then
				-- 	return true
				-- else
				-- 	return not context.in_treesitter_capture("comment")
				-- 		and not context.in_syntax_group("Comment")
				-- end
			end,
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
				end,
			},
			mapping = cmp_mappings,
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{name = "omni", option = {disable_omnifuncs = {"v:lua.vim.lsp.omnifunc"}}},
				-- { name = 'vsnip' }, -- For vsnip users.
				{ name = 'luasnip' }, -- For luasnip users.
				{ name = 'buffer' }, -- text within current buffer
				{ name = "async_path" }, -- file system path
				{ name = "nvim_lua" },
				-- { name = 'ultisnips' }, -- For ultisnips users.
				-- { name = 'snippy' }, -- For snippy users.
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 80,
					ellipsis_char = "...",
				}),
			},
		})
		-- Set configuration for specific filetype.
		cmp.setup.filetype('gitcommit', {
			sources = cmp.config.sources({
				{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				}, {
					{ name = 'buffer' },
			})
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(cmp_mappings),
			sources = {
				{ name = 'buffer' }
			}
		})

	end
},{ "pixldev/bevy-snippets", event = "InsertEnter *.rs", config = function ()
		require("luasnip.loaders.from_vscode").lazy_load()
end}}
