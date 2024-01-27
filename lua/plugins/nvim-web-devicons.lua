return {
	"nvim-tree/nvim-web-devicons",
	lazy = true,
	dependencies = { "NotNullBool/nvim-material-icon" },
	opts = function()
		return { override = require("nvim-material-icon").get_icons() }
	end,
}
