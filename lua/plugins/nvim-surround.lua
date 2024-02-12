return {{
	"NotNullBool/nvim-surround",
	keys = { "ys", "ds", "cs" },
	-- version = "*",
	opts = {
		highlight = {duration = 0}
	},
},{ "XXiaoA/ns-textobject.nvim", enabled = false, keys = { "ys", "ds", "cs",}, dependencies = {"NotNullBool/nvim-surround"}, opts = {}}}
