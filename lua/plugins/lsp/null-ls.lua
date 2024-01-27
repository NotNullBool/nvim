return {
	"jay-babu/mason-null-ls.nvim",
	enabled = false, -- If I do decide to enable remember to set key mappings or set it to load it on save.
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		local mason_null = require("mason-null-ls")
		local null_ls = require("null-ls")
		null_ls.setup()

		mason_null.setup({
			automatic_installation = true,
			handlers = {
				function (source_name, methods)
					mason_null.default_setup(source_name, methods)
				end
			},
		})
		null_ls.setup({
			sources = {
				-- Anything not supported by mason.
			}
		})
	end,
}
