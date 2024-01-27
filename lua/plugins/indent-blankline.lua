return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		indent = {
			tab_char = '▎',
		},
		scope = {
			highlight = {"StorageClass"},
			show_start = false,
			show_end = false,
			include = {
				node_type ={
					['*'] = {
						-- "block",
						"class", -- find names by doing InspectTree command!
						"function",
						"method",
						"^if",
						"^while",
						"^for",
						"^object",
						"^table",
						"^type",
						"field",
						"^import",
						"arguments",
						"return_statement",
						"function_declaration"
					}
				}
			}
		}
	},
	config = function (_, opts)
		local indent_blankline = require("ibl")
		local colors = require("dracula").colors()
		vim.api.nvim_set_hl(0, "IndentBlankLine", {fg = colors.cyan})
		vim.api.nvim_set_hl(0, "ScopeBlankLine", {fg = colors.pink})
		opts.indent.highlight = {"IndentBlankLine"}
		opts.scope.highlight = {"ScopeBlankLine"}
		indent_blankline.setup(opts)

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end
}
